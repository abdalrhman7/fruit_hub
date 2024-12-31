import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../core/utils/app_colors.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.image});

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 2000),
        curve: Curves.linear,
        padding: const EdgeInsets.only(left: 16),
        decoration: ShapeDecoration(
            color: const Color(0xFFEEEEEE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                  color: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: Center(child: SvgPicture.asset(image)),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style:
                  TextStyles.semiBold13.copyWith(color: AppColors.primaryColor),
            )
          ],
        ),
      ),
    );
  }
}
