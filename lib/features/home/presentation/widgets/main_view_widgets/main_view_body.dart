import 'package:flutter/material.dart';
import 'package:fruit/features/home/presentation/views/cart_view.dart';
import 'package:fruit/features/home/presentation/views/product_view.dart';

import 'home_view.dart';


class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentViewIndex,
      children: const [
        HomeView(),
        ProductsView(),
        CartView(),
      ],
    );
  }
}
