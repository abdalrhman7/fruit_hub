import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/core/widgets/custom_network_image.dart';
import 'package:fruit/features/home/presentation/cart_widget/cart_item_action_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 73,
            height: 92,
            decoration: const BoxDecoration(
              color: Color(0xFFF3F5F7),
            ),
            child: const CustomNetworkImage(
                imageUrl:
                    'https://firebasestorage.googleapis.com/v0/b/fruit-hub-aadc8.appspot.com/o/images%2F1000000033.jpg..jpg?alt=media&token=c98acb86-a45b-4804-8620-7215968e4d2d'),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('بطيخ', style: TextStyles.bold13),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Text(
                  '3 كم',
                  style: TextStyles.regular13
                      .copyWith(color: AppColors.secondaryColor),
                ),
                Row(
                  children: [
                    const CartItemActionButtons(),
                    const Spacer(),
                    Text(
                      '60 جنية',
                      style: TextStyles.bold16.copyWith(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
