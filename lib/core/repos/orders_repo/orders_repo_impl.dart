import 'package:dartz/dartz.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit/core/services/data_service.dart';
import 'package:fruit/core/utils/backend_endpoint.dart';
import 'package:fruit/features/checkout/data/model/order_model.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';

class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService fireStoreService;

  OrdersRepoImpl({ required this.fireStoreService});

  @override
  Future<Either<Failures, void>> addOrder({required OrderEntity order}) async {
    try {
      await fireStoreService.addData(
        path: BackendEndpoint.addOrder,
        data: OrderModel.fromEntity(order).toJson(),
      );
      return right(null);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
