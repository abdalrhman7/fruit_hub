import 'package:flutter/material.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/features/on_boarding/presentation/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1BackgroundImage,
          title: Row( children: [
            Text('Fresh'),
            SizedBox(width: 5,),
            Text('Fruits', style: TextStyle(color: Colors.green),)
          ],),
          subTitle: Text('We provide fresh fruits and vegetables for you'),
        )
      ],
    );
  }
}
