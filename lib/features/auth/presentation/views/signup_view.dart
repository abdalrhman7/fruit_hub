import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';
import 'package:fruit/features/auth/domin/repos/auth_repo.dart';
import 'package:fruit/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:fruit/features/auth/presentation/widgets/Signup_view_body_bloc_consumer.dart';


class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}


