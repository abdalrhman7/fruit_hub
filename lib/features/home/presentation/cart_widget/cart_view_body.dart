import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/widgets/build_app_bar.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/features/home/presentation/cart_widget/cart_header.dart';

import 'cart_item.dart';
import 'cart_items_list.dart';

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
            const SliverToBoxAdapter(child: CustomDivider()),
            const CartItemsList(),
            const SliverToBoxAdapter(child: CustomDivider()),
          ],
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height * 0.07,
          left: 16,
          right: 16,
          child: CustomButton(onPressed: () {}, text: 'الدفع 120 جنيه'),
        )
      ],
    );
  }
}
