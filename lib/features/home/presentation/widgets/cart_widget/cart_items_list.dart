import 'package:flutter/material.dart';
import 'package:fruit/features/home/domin/entites/car_item_entity.dart';

import 'cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key, required this.cartItems});

final List<CartItemEntity> cartItems ;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(
            cartItemEntity: cartItems[index],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const CustomDivider();
      },
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: .5,
      color: Color(0xFFF1F1F5),
      height: 22,
    );
  }
}
