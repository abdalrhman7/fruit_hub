import 'package:flutter/material.dart';
import 'package:fruit/features/splash/presentation/widgets/splash_view_body.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = "splash";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SplashViewBody()),
    );
  }
}