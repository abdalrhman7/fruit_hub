import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/features/home/domin/entites/car_item_entity.dart';
import 'package:fruit/features/home/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';

class CartItemActionButtons extends StatelessWidget {
  const CartItemActionButtons({super.key , required this.cartItemEntity});

  final  CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          icon: Icons.add,
          color: AppColors.primaryColor,
          onPressed: () {
            cartItemEntity.increaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          iconColor: Colors.white,
        ),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            cartItemEntity.quantity.toString(),
            textAlign: TextAlign.center,
            style: TextStyles.bold16,
          ),
        ),
        CartItemActionButton(
          icon: Icons.remove,
          color: const Color(0xFFF3F5F7),
          onPressed: () {
            cartItemEntity.decreaseQuantity();
            context.read<CartItemCubit>().updateCartItem(cartItemEntity);
          },
          iconColor: Colors.grey,
        ),
      ],
    );
  }
}

class CartItemActionButton extends StatelessWidget {
  const CartItemActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.onPressed,
    required this.iconColor,
  });

  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: FittedBox(
            child: Icon(
          icon,
          color: iconColor,
        )),
      ),
    );
  }
}
