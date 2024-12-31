import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruit/features/home/presentation/cubit/cart_item_cubit/cart_item_cubit.dart';

class CustomCartButton extends StatelessWidget {
  const CustomCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
            onPressed: () {},
            text:
            'الدفع ${context
                .watch<CartCubit>()
                .cartEntity
                .calculateTotalPrice()} جنيه');
      },
    );
  }
}