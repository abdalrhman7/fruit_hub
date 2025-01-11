import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/payment_section/payment_item.dart';


class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
    required this.pageController,
  });

 final PageController pageController;
  @override
  Widget build(BuildContext context) {
   // log(context.read<OrderEntity>().toString());
    return PaymentItem(
      title: 'عنوان التوصيل',
      child: Row(
        children: [
          const Icon(Icons.edit_location_alt_rounded , size: 18,),
          const SizedBox(
            width: 8,
          ),
          Text(
            //toString of Shipping Address Entity
            ' ${context.read<OrderEntity>().shippingAddressEntity.toString()}',
            textAlign: TextAlign.right,
            style: TextStyles.regular13.copyWith(
              color: const Color(0xFF4E5556),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn);
            },
            child: SizedBox(
              child: Row(
                children: [
                  const Icon(Icons.edit , size: 18,),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    'تعديل',
                    style: TextStyles.semiBold13.copyWith(
                      color: const Color(0xFF949D9E),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
