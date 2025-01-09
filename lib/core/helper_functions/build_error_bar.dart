import 'package:flutter/material.dart';

void showErrorBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration:  const Duration(milliseconds: 500),
      content: Text(message),
    ),
  );
}
