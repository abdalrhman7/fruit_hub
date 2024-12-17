import 'package:bloc/bloc.dart';
import 'package:fruit/core/entities/product_entity.dart';
import 'package:fruit/features/home/domin/entites/car_item_entity.dart';
import 'package:fruit/features/home/domin/entites/cart_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity  cartEntity = CartEntity([]);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    if (isProductExist) {
      //increment count
    }else{
      CartItemEntity cartItemEntity = CartItemEntity(productEntity: productEntity, count: 1);
      cartEntity.addCartItem(cartItemEntity);
    }
    emit(CartItemAdded());
  }
}
