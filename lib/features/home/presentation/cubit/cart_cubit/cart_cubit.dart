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
    CartItemEntity cartItems = cartEntity.getCarItemOrCartItemEntity(productEntity);
    // if product exist increase count
    if (isProductExist) {
      cartItems.increaseCount();
    }else{
      // if product not exist add to cart
      cartEntity.addCartItem(cartItems);
    }
    emit(CartItemAdded());
  }


  void deleteCartItem(CartItemEntity cartItemEntity) {
    cartEntity.removeCarItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
