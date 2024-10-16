import 'package:dartz/dartz.dart';
import 'package:fruit/core/entities/product_entity.dart';
import 'package:fruit/core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failures, List<ProductEntity>>> getProducts();
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts();
}
