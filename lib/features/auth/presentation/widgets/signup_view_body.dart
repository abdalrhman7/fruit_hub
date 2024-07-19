import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/constants.dart';
import 'package:fruit/core/helper_functions/build_error_bar.dart';
import 'package:fruit/core/widgets/custom_button.dart';
import 'package:fruit/core/widgets/password_field.dart';
import 'package:fruit/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:fruit/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:fruit/features/auth/presentation/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, userName, password;
  late bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizintalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  isTermsAccepted = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                            name: userName,
                          );
                    } else {
                      buildErrorBar(
                        context,
                        'يجب عليك الموافقة على الشروط والإحكام',
                      );
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(
                height: 26,
              ),
              const HaveAnAccountWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

