import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/widgets/fruit_item.dart';
import 'package:fruit/core/widgets/search_text_faild.dart';
import 'package:fruit/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruit/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruit/features/home/presentation/widgets/featured_list.dart';

import 'best_selling_grid_view.dart';
import 'featured_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: kTopPadding),
                CustomHomeAppBar(),
                SizedBox(height: kTopPadding),
                SearchTextField(),
                SizedBox(height: 12),
                FeaturedList(),
                SizedBox(height: 12),
                BestSellingHeader(),
                SizedBox(height: 8),
              ],
            ),
          ),
          BestSellingGridView(),
        ],
      ),
    );
  }
}
