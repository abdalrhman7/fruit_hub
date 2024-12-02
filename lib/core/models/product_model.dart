import 'dart:io';

import 'package:fruit/core/entities/product_entity.dart';
import 'package:fruit/core/entities/review_entity.dart';
import 'package:fruit/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
  final List<ReviewModel> reviews;
  final num? avgRating;

  // final num sellingCount;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.price,
    required this.isFeatured,
    this.imageUrl,
    required this.expirationsMonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.avgRating,
    // required this.sellingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      code: json['code'],
      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      expirationsMonths: json['expirationsMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
      avgRating: 5,
      //avgRating: getAvgRating(json['reviews']),
      //  sellingCount: json['sellingCount'],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      expirationsMonths: expirationsMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expirationsMonths': expirationsMonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}

num getAvgRating(List<ReviewEntity> reviews) {
  if (reviews.isEmpty) return 0.0;
  var totalRating = 0.0;
  for (var review in reviews) {
    totalRating += review.rating;
  }
  return totalRating / reviews.length;
}
