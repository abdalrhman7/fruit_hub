import 'package:flutter/material.dart';
import 'package:fruit/features/checkout/presentation/views/widgets/shipping_widgets/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = -1  ;
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        const SizedBox(height:33),
        ShippingItem(
          onTap:  () {
            selectedIndex = 0;
            setState(() {});
          },
          isSelected: selectedIndex == 0,
          title: 'الدفع عند الاستلام',
          subtitle: 'تتم دفع الطلب عند استلامه من المتجر',
          price: '40 جنيه',
        ),
        const SizedBox(height:16),
        ShippingItem(
          onTap:  () {
            selectedIndex = 1;
            setState(() {});
          },
          isSelected: selectedIndex == 1,
          title: 'الدفع اولاين',
          subtitle: 'يرجي تحديد طريقة الدفع',
          price: 'مجاني',
        ),
      ],
    );
  }
}
