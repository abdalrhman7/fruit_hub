import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/build_app_bar.dart';
import 'package:fruit/features/checkout_view/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const routeName = '/checkout-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
      body: const CheckoutViewBody(),
    );
  }
}
