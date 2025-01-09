import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/build_app_bar.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit/features/home/domin/entites/car_item_entity.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key , required this.cartItems});

  static const routeName = '/checkout-view';
  final List<CartItemEntity> cartItems ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
      body: const CheckoutViewBody(),
    );
  }
}
