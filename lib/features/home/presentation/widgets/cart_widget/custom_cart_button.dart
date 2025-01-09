import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/helper_functions/build_error_bar.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/features/checkout/presentation/views/checkout_view.dart';
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
          onPressed: () {
            if (context.read<CartCubit>().cartEntity.cartItems.isNotEmpty) {
              Navigator.pushNamed(context, CheckoutView.routeName,
                arguments: context.read<CartCubit>().cartEntity,
              );
            }else{
              showErrorBar(context, 'لا يوجد منتجات في السله');
            }
          },
          text:
          //watch search for nearest build method and rebuild it
              'الدفع ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} جنيه',
        );
      },
    );
  }
}
