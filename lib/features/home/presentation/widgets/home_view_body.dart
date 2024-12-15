import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/widgets/search_text_faild.dart';
import 'package:fruit/features/home/presentation/widgets/best_selling_header.dart';
import 'package:fruit/features/home/presentation/widgets/featured_list.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'product_grid_view_bloc_builder_state.dart';
import 'custom_home_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

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
           ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}


