import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:svg_flutter/svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Container(
        padding: const EdgeInsets.all(16),
        decoration: const ShapeDecoration(
          color: Color(0xFFEEF8ED),
          shape: OvalBorder(),
        ),
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
      leading: Image.asset(
        Assets.imagesProfileImage,
      ),
      title: Text(
        'صباح الخير',
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(color: Colors.black),
      ),
      subtitle: const Text(
        'مرحبا بك',
        textAlign: TextAlign.right,
        style: TextStyles.bold16,
      ),
    );
  }
}
