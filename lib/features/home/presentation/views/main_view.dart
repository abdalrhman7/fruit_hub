import 'package:flutter/material.dart';
import 'package:fruit/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import '../widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  static const routeName = 'home_view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: HomeView(),
      ),
    );
  }
}
