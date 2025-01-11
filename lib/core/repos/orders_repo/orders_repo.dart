import 'package:dartz/dartz.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/features/checkout/data/model/order_model.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failures, void>> addOrder({required OrderEntity order});
}
