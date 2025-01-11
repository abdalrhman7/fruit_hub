
import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_text_styles.dart';
import 'package:fruit/core/widgets/notification_widget.dart';

AppBar buildAppBar(context, {required String title , bool showBackButton = true , bool showNotification = true}) {
  return AppBar(
    actions:  [
      Visibility(
        visible: showNotification,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: NotificationWidget(),
        ),
      ),
    ],
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: true,
    title:  Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}