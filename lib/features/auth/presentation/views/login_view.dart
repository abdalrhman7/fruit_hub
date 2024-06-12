import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';
import 'package:fruit/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context , title: 'تسجيل الدخول'),
      body: const LoginViewBody(),
    );
  }

}
