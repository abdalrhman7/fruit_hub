import 'package:flutter/material.dart';
import 'package:fruit/core/helper_functions/get_user.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const NotificationWidget(),
      leading: Image.asset(
        Assets.imagesProfileImage,
      ),
      title: Text(
        'صباح الخير',
        textAlign: TextAlign.right,
        style: TextStyles.regular16.copyWith(color: Colors.black),
      ),
      subtitle:  Text(
        getUser().name,
        textAlign: TextAlign.right,
        style: TextStyles.bold16,
      ),
    );
  }
}


