

import 'package:fruit/features/checkout/data/model/shipping_address_model.dart';
import 'package:fruit/features/checkout/domain/entites/order_entity.dart';
import 'package:uuid/uuid.dart';

import 'order_product_model.dart';

class OrderModel {
  final double totalPrice;
  final String orderId;
  final String uId;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel(
      {required this.totalPrice,
        required this.uId,
        required this.shippingAddressModel,
        required this.orderProducts,
        required this.paymentMethod,
        required this.orderId,
      });

  factory OrderModel.fromEntity(OrderInputEntity orderEntity) {
    return OrderModel(
      orderId: Uuid().v4(),
      totalPrice: orderEntity.cartEntity.calculateTotalPrice(),
      uId: orderEntity.uID,
      shippingAddressModel:
      ShippingAddressModel.fromEntity(orderEntity.shippingAddressEntity),
      orderProducts: orderEntity.cartEntity.cartItems
          .map((e) => OrderProductModel.fromEntity(
        cartItemEntity: e,
      ))
          .toList(),
      paymentMethod: orderEntity.payWithCash! ? 'Cash' : 'Paypal',
    );
  }
  Map<String, dynamic> toJson() {
    return {
    'orderId': orderId,
    'totalPrice': totalPrice,
    'uId': uId,
    'status': 'pending',
    'date': DateTime.now().toString(),
    'shippingAddressModel': shippingAddressModel.toJson(),
    'orderProducts': orderProducts.map((e) => e.toJson()).toList(),
    'paymentMethod': paymentMethod,
  };
  }
}

// payment method
