import 'package:flutter/material.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/payment_section/payment_section.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/shipping_widgets/shipping_section.dart';
import 'address_widgets/address_input_section.dart';
import 'checkout_steps.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return getPages()[index];
        },
        itemCount: getPages().length,
      ),
    );
  }

  List<Widget> getPages() {
    return [
      const ShippingSection(),
      AddressInputSection(formKey: formKey),
      const PaymentSection(),
    ];
  }
}
