import 'package:fruit/features/checkout/domain/entites/shipping_address_entity.dart';
import 'package:fruit/features/home/domin/entites/car_item_entity.dart';
import 'package:fruit/features/home/domin/entites/cart_entity.dart';

class OrderEntity {
 // final String uID;
  final CartEntity cartEntity;
 // List<CartItemEntity> cartItems ;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddressEntity = ShippingAddressEntity();
  OrderEntity(
      this.cartEntity,
      {
        this.payWithCash,
         this.shippingAddressEntity,
        //required this.uID,
       // required this.cartItems
      });

  double calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calcualteShippingDiscount() {
    return 0;
  }

  // double calculateTotalPriceAfterDiscountAndShipping() {
  //   return cartEntity.calculateTotalPrice() +
  //       calculateShippingCost() -
  //       calcualteShippingDiscount();
  // }


  // @override
  // String toString() {
  //
  //   return 'OrderEntity{uID: $uID, cartEntity: $cartEntity, payWithCash: $payWithCash, shippingAddressEntity: $shippingAddressEntity}';
  //
  // }

}

