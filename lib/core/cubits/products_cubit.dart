import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../repos/product_repo/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductRepo productsRepo;
  int productsLength = 0;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (r) {
        print('goooooooooooooooooooooooooooooooooooooooood');
        productsLength = r.length;
        emit(ProductsSuccess(products: r));
      },
    );
  }

  Future<void> getBestSellingroducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
          (failure) => emit(ProductsFailure(errMessage:failure.message)),
          (products) {
        productsLength = products.length;
        emit(ProductsSuccess(products: products));
      },
    );
  }
}
