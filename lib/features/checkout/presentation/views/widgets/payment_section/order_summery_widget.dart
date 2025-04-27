import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/payment_section/payment_item.dart';
import 'package:provider/provider.dart';


class OrderSummeryWidget extends StatelessWidget {
  const OrderSummeryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      title: 'ملخص الطلب :',
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
               Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice().floor()} جنيه',
                style: TextStyles.semiBold16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'التوصيل :',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                '30 جنيه',
                style: TextStyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Divider(thickness: .5, color: Color(0xFFCACECE),),
          const SizedBox(height: 8),
           Row(
            children: [
              const Text(
                'الكلي',
                style: TextStyles.bold16,
              ),
              const Spacer(),
              Text(
                '${context.read<OrderInputEntity>().cartEntity.calculateTotalPrice().floor() + 30} جنيه',
                style: TextStyles.bold16,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
