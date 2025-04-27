import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatefulWidget {
  const AddressInputSection({super.key, required this.formKey, required this.valueListenable});
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: ValueListenableBuilder<AutovalidateMode>(
          valueListenable: widget.valueListenable,
        builder : (context, value, child) {
          return Form(
            key: widget.formKey,
            autovalidateMode: value,
            child: Column(
              children: [
                const SizedBox(height: 24),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.name = value;
                  },
                  hintText: 'الاسم',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.email = value;
                  },
                  hintText: 'البريد الالكتروني',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.address = value;
                  },
                  hintText: 'العنون',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.city = value;
                  },
                  hintText: 'المدينه',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.floor = value;
                  },
                  hintText: 'رقم الطابق و الشقه',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 16),
                CustomTextFormField(
                  onSaved: (value) {
                    context.read<OrderInputEntity>().shippingAddressEntity.phone = value;
                  },
                  hintText: 'رقم الهاتف',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 16),

              ],
            ),
          );
        },

      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
