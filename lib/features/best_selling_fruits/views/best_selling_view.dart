import 'package:flutter/material.dart';
import 'package:fruit/core/widgets/build_app_bar.dart';
import 'package:fruit/features/best_selling_fruits/views/widgets/best_selling_view_nody.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const routeName = 'bestSellingView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context ,title: 'الأكثر مبيعًا'),
      body: const BestSellingViewBody(),
    );
  }


}
