import 'package:flutter/material.dart';
import 'package:fruit/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:fruit/main.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 24),
          CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity!.name = value;
            },
            hintText: 'الاسم',
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 16),
           CustomTextFormField(
            onSaved: (value) {
              context.read<OrderEntity>().shippingAddressEntity!.email = value;
            },
            hintText: 'البريد الالكتروني',
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 16),
           CustomTextFormField(
             onSaved: (value) {
               context.read<OrderEntity>().shippingAddressEntity!.address = value;
             },
            hintText: 'العنون',
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 16),
           CustomTextFormField(
             onSaved: (value) {
               context.read<OrderEntity>().shippingAddressEntity!.city = value;
             },
            hintText: 'المدينه',
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 16),
           CustomTextFormField(
             onSaved: (value) {
               context.read<OrderEntity>().shippingAddressEntity!.floor = value;
             },
            hintText: 'رقم الطابق و الشقه',
            textInputType: TextInputType.name,
          ),
          const SizedBox(height: 16),
           CustomTextFormField(
             onSaved: (value) {
               context.read<OrderEntity>().shippingAddressEntity!.phone = value;
             },
            hintText: 'رقم الهاتف',
            textInputType: TextInputType.number,
          ),
          const SizedBox(height: 16),

        ],
      ),
    );
  }
}
