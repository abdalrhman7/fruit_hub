import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/helper_functions/get_user.dart';
import 'package:fruit/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/core/widgets/build_app_bar.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruit/features/checkout/presentation/cubit/app_order_cubit/app_order_cubit.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/add_order_cubit_bloc_builder.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:fruit/features/home/domin/entites/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});

  static const routeName = '/checkout-view';
  final CartEntity cartEntity;

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;

  @override
  void initState() {
    orderEntity = OrderEntity(
      uID: getUser().uid,
      widget.cartEntity,
      shippingAddressEntity: ShippingAddressEntity(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddOrderCubit>(
      create: (context) => AddOrderCubit(orderRepo: getIt.get<OrdersRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'الشحن', showNotification: false),
        body: Provider.value(
          value: orderEntity,
          child: const AddOrderCubitBlocBuilder(
            child: CheckoutViewBody(),
          ),
        ),
      ),
    );
  }
}
