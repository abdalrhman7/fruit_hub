import 'package:fruit/features/home/domin/entites/car_item_entity.dart';


import 'item.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  factory ItemList.fromEntity({required List<CartItemEntity> items}) {
    return ItemList(items: items.map((e) {
      return ItemEntity.fromEntity(e);
    }).toList());
  }

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
}
