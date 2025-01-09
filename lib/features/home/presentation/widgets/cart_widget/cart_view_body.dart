import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/widgets/build_app_bar.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';

import 'cart_header.dart';
import 'cart_items_list.dart';
import 'custom_cart_button.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: kTopPadding),
                  buildAppBar(context, title: 'السله', showNotification: false),
                  const SizedBox(height: kTopPadding),
                  const CartHeader(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const Center(
                      child: Text('لا يوجد منتجات في السله'),
                    )
                  : const CustomDivider(),
            ),
            CartItemsList(
              //watch search for nearest build method and rebuild it
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
            SliverToBoxAdapter(
              child: context.read<CartCubit>().cartEntity.cartItems.isEmpty
                  ? const SizedBox.shrink()
                  : const CustomDivider(),
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.07,
          left: 16,
          right: 16,
          child: const CustomCartButton(),
        )
      ],
    );
  }
}
