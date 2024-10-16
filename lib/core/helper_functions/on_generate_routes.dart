import 'package:flutter/material.dart';
import 'package:fruit/features/auth/presentation/views/sign_in_view.dart';
import 'package:fruit/features/auth/presentation/views/signup_view.dart';
import 'package:fruit/features/best_selling_fruits/views/best_selling_view.dart';
import 'package:fruit/features/home/presentation/views/main_view.dart';
import 'package:fruit/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:fruit/features/splash/presentation/views/splash_view.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case MainView.routeName:
      return MaterialPageRoute(builder: (context) => const MainView());
      case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => const BestSellingView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}