import 'package:flutter/material.dart';

abstract class AppDecoration {
  static ShapeDecoration greyBoxDecoration = ShapeDecoration(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    color: const Color(0x7FF2F3F3),
  );
}
