import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_text_styles.dart';

AppBar buildAppBar( BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white ,
    leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back_ios_new_outlined)),
    centerTitle: true,
    title: Text(title, style: TextStyles.bold19),
  );
}