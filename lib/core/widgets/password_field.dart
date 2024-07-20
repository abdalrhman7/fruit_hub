

import 'package:flutter/material.dart';
import 'package:fruit/features/auth/presentation/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key, this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: (value) {
        widget.onSaved!(value);
      },
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      suffixIcon:  GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
          child: Icon(obscureText ? Icons.visibility : Icons.visibility_off)),
    );
  }
}
