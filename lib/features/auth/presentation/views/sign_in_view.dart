import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/services/get_it_service.dart';
import 'package:fruit/core/widgets/custom_app_bar.dart';
import 'package:fruit/features/auth/presentation/cubits/signin_cubit/sign_in_cubit.dart';
import 'package:fruit/features/auth/presentation/widgets/login_view_body.dart';

import '../../domin/repos/auth_repo.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل الدخول'),
        body: const SignInViewBody(),
      ),
    );
  }

}
