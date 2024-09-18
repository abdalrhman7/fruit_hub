import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class InActiveItem extends StatelessWidget {
  const InActiveItem({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        color: Colors.transparent,
        child: SvgPicture.asset(image , fit: BoxFit.scaleDown,));
  }
}
