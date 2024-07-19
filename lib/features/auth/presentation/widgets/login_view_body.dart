import 'package:flutter/material.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:fruit/features/auth/presentation/widgets/social_login_button.dart';

import '../../../../core/utils/app_text_styles.dart';
import 'dont_have_an_account_widget.dart';
import 'or_divider.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
              textInputType: TextInputType.emailAddress,
              hintText: 'البريد الإلكتروني',
            ),
            const SizedBox(height: 16),
            const CustomTextFormField(
              textInputType: TextInputType.visiblePassword,
              hintText: 'كلمة المرور',
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'هل نسيت كلمة المرور؟',
                  style: TextStyles.semiBold13
                      .copyWith(color: AppColors.lightPrimaryColor),
                ),
              ],
            ),
            const SizedBox(height: 32),
            CustomButton(onPressed: () {}, text: 'تسجيل دخول'),
            const SizedBox(
              height: 33,
            ),
            const DontHaveAnAccountWidget(),
            const SizedBox(
              height: 33,
            ),
            const OrDivider(),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.imagesGoogleIcon,
              title: 'تسجيل دخول بواسطة جوجل',
              onPressed: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.imagesApplIcon,
              title: 'تسجيل دخول بواسطة أبل',
              onPressed: () {},
            ),
            const SizedBox(
              height: 16,
            ),
            SocialLoginButton(
              image: Assets.imagesFacebookIcon,
              title: 'تسجيل دخول بواسطة فيسبوك',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
