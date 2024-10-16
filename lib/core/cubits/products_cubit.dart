import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/entities/product_entity.dart';
import 'package:meta/meta.dart';

import '../repos/product_repo/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());
  final ProductRepo productsRepo;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    var result = await productsRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (r) {
        print('goooooooooooooooooooooooooooooooooooooooood');
        emit(ProductsSuccess(products: r));
      },
    );
  }
}
