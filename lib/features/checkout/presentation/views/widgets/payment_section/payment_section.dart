import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/payment_section/order_summery_widget.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/payment_section/payment_item.dart';

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 24),
        OrderSummeryWidget(),
      ],
    );
  }
}

