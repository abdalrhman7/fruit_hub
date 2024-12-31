import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/widgets/build_app_bar.dart';
import 'package:fruit/core/widgets/search_text_faild.dart';
import 'package:fruit/features/home/presentation/widgets/main_view_widgets/product_grid_view_bloc_builder_state.dart';
import 'package:fruit/features/home/presentation/widgets/main_view_widgets/product_view_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: kTopPadding),
                buildAppBar(context , title: 'المنتجات' , showBackButton: false),
                const SizedBox(height: kTopPadding),
                const SearchTextField(),
                const SizedBox(height: 12),
                const ProductViewHeader(),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const ProductsGridViewBlocBuilder(),
        ],
      ),
    );
  }
}