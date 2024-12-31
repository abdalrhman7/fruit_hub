import 'package:flutter/material.dart';
import 'package:fruit/features/home/domin/entites/bottom_navigation_bar_entity.dart';
import 'package:fruit/features/home/presentation/widgets/main_view_widgets/active_item.dart';

import 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ActiveItem(
            image: bottomNavigationBarEntity.activeImage,
            text: bottomNavigationBarEntity.name,
          )
        : InActiveItem(image: bottomNavigationBarEntity.inActiveImage);
  }
}
