import 'package:flutter/material.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/payment_section/order_summery_widget.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/payment_section/shipping_address_widget.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key , required this.pageController,});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          const OrderSummeryWidget(),
          const SizedBox(height: 16),
          ShippingAddressWidget(pageController: pageController),
        ],
      ),
    );
  }
}

