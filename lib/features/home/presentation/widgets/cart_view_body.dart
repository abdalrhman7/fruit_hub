import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/widgets/build_app_bar.dart';
import 'package:fruit/features/home/presentation/widgets/cart_header.dart';


class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPadding),
                buildAppBar(context , title: 'السله' ,showNotification: false),
                const SizedBox(height: kTopPadding),
                const CartHeader(),
               const SizedBox(height: 12),
              ],
            ),
          ),

        ],
      ),
    );
  }
}