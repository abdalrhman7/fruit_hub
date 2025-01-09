import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/build_app_bar.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit/features/home/domin/entites/car_item_entity.dart';
import 'package:fruit/features/home/domin/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = '/checkout-view';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
      body: Provider.value(
        value: OrderEntity(cartEntity),
        child: const CheckoutViewBody(),
      ),
    );
  }
}
