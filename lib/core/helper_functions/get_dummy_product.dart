import 'package:fruit/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Dummy Product',
    code: 'DUMMY001',
    description: 'This is a dummy product',
    price: 10.99,
    reviews: [],
    expirationsMonths: 6,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true,
    isFeatured: true,
    imageUrl: null,
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(5, (index) => getDummyProduct());
}
