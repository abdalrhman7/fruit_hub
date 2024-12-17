import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/core/widgets/custom_network_image.dart';
import 'package:fruit/features/home/domin/entites/car_item_entity.dart';
import 'package:fruit/features/home/presentation/cart_widget/cart_item_action_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});

  final CartItemEntity cartItemEntity;

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
            child: CustomNetworkImage(
                imageUrl: cartItemEntity.productEntity.imageUrl!),
          ),
          const SizedBox(width: 17),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(cartItemEntity.productEntity.name,
                        style: TextStyles.bold13),
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
                  '${cartItemEntity.calculateTotalWeight()} كم',
                  style: TextStyles.regular13
                      .copyWith(color: AppColors.secondaryColor),
                ),
                Row(
                  children: [
                    const CartItemActionButtons(),
                    const Spacer(),
                    Text(
                      '${cartItemEntity.calculateTotalPrice}  جنية',
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
