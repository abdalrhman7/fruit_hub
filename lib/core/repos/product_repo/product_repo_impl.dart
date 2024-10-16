import 'package:dartz/dartz.dart';
import 'package:fruit/core/entities/product_entity.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/core/repos/product_repo/product_repo.dart';
import 'package:fruit/core/services/data_service.dart';
import 'package:fruit/core/utils/backend_endpoint.dart';

import '../../models/product_model.dart';

class ProductRepoImpl extends ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});

  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() async{
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts,
        query: {
            'limit': '10',
          'orderBy': 'sellingCount',
          'descending': true,
        }
      ) as List<Map<String, dynamic>>;
      List<ProductModel> products =
      data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities =
      products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } on Exception catch (e) {
      return left(ServerFailure('failed to get products'));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;
      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> productEntities =
          products.map((e) => e.toEntity()).toList();
      return right(productEntities);
    } on Exception catch (e) {
      return left(ServerFailure('failed to get products'));
    }
  }
}
