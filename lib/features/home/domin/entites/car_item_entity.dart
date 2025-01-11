import 'package:equatable/equatable.dart';
import 'package:fruit/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({required this.productEntity, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmount * quantity;
  }

  increaseQuantity() {
    quantity++;
  }

  decreaseQuantity() {
    quantity--;
  }

  @override
  List<Object?> get props => [productEntity];
}