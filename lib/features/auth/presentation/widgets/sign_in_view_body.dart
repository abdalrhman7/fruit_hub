import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/utils/app_colors.dart';
import 'package:fruit/core/utils/app_images.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/core/widgets/password_field.dart';
import 'package:fruit/features/auth/presentation/cubits/signin_cubit/sign_in_cubit.dart';
import 'package:fruit/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:fruit/features/auth/presentation/widgets/social_login_button.dart';

import '../../../../core/utils/app_text_styles.dart';
import 'dont_have_an_account_widget.dart';
import 'or_divider.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                textInputType: TextInputType.emailAddress,
                hintText: 'البريد الإلكتروني',
              ),
              const SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
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
              CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context.read<SignInCubit>().signIn(email: email, password: password);
                    } else {
                      _autoValidateMode = AutovalidateMode.always;
                    }
                  },
                  text: 'تسجيل دخول'),
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
                onPressed: () {
                  context.read<SignInCubit>().signInWithGoogle();
                },
              ),
              const SizedBox(
                height: 16,
              ),
              // SocialLoginButton(
              //   image: Assets.imagesApplIcon,
              //   title: 'تسجيل دخول بواسطة أبل',
              //   onPressed: () {},
              // ),
              const SizedBox(
                height: 16,
              ),
              SocialLoginButton(
                image: Assets.imagesFacebookIcon,
                title: 'تسجيل دخول بواسطة فيسبوك',
                onPressed: () {
                  context.read<SignInCubit>().signInWithFacebook();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
