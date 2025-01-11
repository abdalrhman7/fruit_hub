import 'package:bloc/bloc.dart';
import 'package:fruit/core/repos/orders_repo/orders_repo.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:meta/meta.dart';

part 'app_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit({required this.orderRepo}) : super(AddOrderInitial());

  final OrdersRepo orderRepo ;

  void addOrder({required OrderEntity order}) async {
    emit(AddOrderLoading());
    var result = await orderRepo.addOrder(order: order);
    result.fold(
      (failure) => emit(AddOrderFailure(errMessage: failure.message)),
      (r) => emit(AddOrderSuccess()),
    );
  }
}
