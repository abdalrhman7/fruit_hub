import 'package:fruit/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage;
  final String inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });

}
List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldHome,
    inActiveImage: Assets.imagesOutlineHome,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldProducts,
    inActiveImage: Assets.imagesOutlineProducts,
    name: 'المنتجات',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldShoppingCart,
    inActiveImage: Assets.imagesOutlineShoppingCart,
    name: 'السلة',
  ),
  BottomNavigationBarEntity(
    activeImage: Assets.imagesBoldUser,
    inActiveImage: Assets.imagesOutlineUser,
    name: 'حسابي',
  ),
];