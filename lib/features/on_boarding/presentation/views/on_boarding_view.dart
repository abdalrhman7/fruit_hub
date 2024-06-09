import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit/features/on_boarding/presentation/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'OnBoardingView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: OnBoardingViewBody(),
      ),
    );
  }
}
