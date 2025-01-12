import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruit/core/helper_functions/build_error_bar.dart';
import 'package:fruit/core/utils/app_keys.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit/features/checkout/domain/entites/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruit/features/checkout/presentation/cubit/app_order_cubit/app_order_cubit.dart';
import 'package:provider/provider.dart';
import 'checkout_steps.dart';
import 'checkout_steps_page_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier<AutovalidateMode>(AutovalidateMode.disabled);

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CheckoutSteps(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
            onTap: (index) {
              if (currentPageIndex == 0) {
                pageController.animateToPage(index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              } else if (index == 1) {
                var orderEntity = context.read<OrderEntity>();
                if (orderEntity.payWithCash != null) {
                  pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                } else {
                  showBar(context, 'يجب عليك تحديد طريقة الدفع');
                }
              } else {
                _handleAddressSectionVaildation(context);
              }
            },
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: formKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (currentPageIndex == 0) {
                _handleShippingSectionVaildation(context);
              } else if (currentPageIndex == 1) {
                _handleAddressSectionVaildation(context);
              } else {
                _processPayment(context);
              }
            },
            text: getNextButtonText(),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  void _handleShippingSectionVaildation(BuildContext context) {
    if (context.read<OrderEntity>().payWithCash != null) {
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      showBar(context, 'يجب عليك تحديد طريقة الدفع');
    }
  }

  void _handleAddressSectionVaildation(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      pageController.animateToPage(
        currentPageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  String getNextButtonText() {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع عبر PayPal';
      default:
        return 'Next';
    }
  }

  void _processPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    PaypalPaymentEntity paypalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    var addOrderCubit = context.read<AddOrderCubit>();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: clientId,
        secretKey: secretKey,
        transactions: [
          paypalPaymentEntity.toJson(),
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          Navigator.pop(context);
          showBar(context, 'تمت العملية بنجاح');
          addOrderCubit.addOrder(order: orderEntity);
        },
        onError: (error) {
          print("onError: $error");
          Navigator.pop(context);
          log(error.toString());
          showBar(context, 'حدث خطأ في عملية الدفع');
        },
        onCancel: () {
          print('cancelled:');
        },
      ),
    ));
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }
}
