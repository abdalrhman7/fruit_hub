import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/fruit_item.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/shipping_widgets/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> with AutomaticKeepAliveClientMixin {
  int selectedIndex = -1  ;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return   Column(
      children: [
        const SizedBox(height:33),
        ShippingItem(
          onTap:  () {
            selectedIndex = 0;
            setState(() {

            });
            orderEntity.payWithCash = true;
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'تتم دفع الطلب عند استلامه من المتجر',
          price: (orderEntity.cartEntity.calculateTotalPrice() + 40).toString(),
        ),
        const SizedBox(height:16),
        ShippingItem(
          onTap:  () {
            selectedIndex = 1;
            setState(() {});
            orderEntity.payWithCash = false;
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع اولاين',
          subtitle: 'يرجي تحديد طريقة الدفع',
          price: context.read<OrderEntity>().cartEntity.calculateTotalPrice().toString(),
        ),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
