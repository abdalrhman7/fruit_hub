import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(color: Color(0xFFEBF9F1)),
      alignment: Alignment.center,
      child:  Text(
        'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
        style: const TextStyle(
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
