import 'package:fruit/core/helper_functions/get_currency.dart';
import 'package:fruit/features/home/domin/entites/car_item_entity.dart';


class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };

  factory ItemEntity.fromEntity(CartItemEntity itemEntity) {
    return ItemEntity(
      name: itemEntity.productEntity.name,
      quantity: itemEntity.quantity,
      price: itemEntity.productEntity.price.toString(),
      currency: getCurrency(),
    );
  }
}
