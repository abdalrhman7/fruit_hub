import 'package:flutter/material.dart';
import 'package:fruit/features/home/presentation/cart_widget/cart_item.dart';

class CartItemsList extends StatelessWidget {
  const CartItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CartItem(),
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
