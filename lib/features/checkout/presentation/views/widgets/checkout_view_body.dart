import 'package:flutter/material.dart';
import 'package:fruit/core/helper_functions/build_error_bar.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/core/widgets/fruit_item.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
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
          ),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: formKey,
            ),
          ),
          CustomButton(
            onPressed: () {
              if (context.read<OrderEntity>().payWithCash != null) {
                pageController.animateToPage(
                  currentPageIndex + 1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                showErrorBar(context, 'يجب عليك تحديد طريقة الدفع');
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

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
