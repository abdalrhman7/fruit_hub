import 'package:flutter/material.dart';
import 'package:fruit/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import '../widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: HomeViewBody(),
      ),
    );
  }
}
