import 'package:flutter/material.dart';
import 'package:fruit/features/auth/presentation/widgets/custom_text_form_field.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 24),
          CustomTextFormField(
            hintText: 'الاسم',
            textInputType: TextInputType.name,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'البريد الالكتروني',
            textInputType: TextInputType.name,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'العنون',
            textInputType: TextInputType.name,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'المدينه',
            textInputType: TextInputType.name,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'رقم الطابق و الشقه',
            textInputType: TextInputType.name,
          ),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: 'رقم الهاتف',
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 16),

        ],
      ),
    );
  }
}
