import 'package:flutter/material.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
      alignment: Alignment.center,
      child: const Text(
        'لديك 0 منتجات في سله التسوق',
        style: TextStyle(
          fontSize: 13,
          color: Color(0xFF1B5E37),
          fontWeight: FontWeight.w400,
          fontFamily: 'cairo',
          height: .12,
        ),
      ),
    );
  }
}
