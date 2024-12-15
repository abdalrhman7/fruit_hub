import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/cubits/products_cubit.dart';
import 'package:fruit/core/repos/product_repo/product_repo.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/features/home/presentation/widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(getIt.get<ProductRepo>())..getProducts(),
      child: const ProductsViewBody(),
    );
  }
}


