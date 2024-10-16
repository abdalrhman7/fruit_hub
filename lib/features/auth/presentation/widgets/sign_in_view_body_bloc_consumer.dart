import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/core/helper_functions/build_error_bar.dart';
import 'package:fruit/core/widgets/custom_progress_hud.dart';
import 'package:fruit/features/auth/presentation/cubits/signin_cubit/sign_in_cubit.dart';
import 'package:fruit/features/auth/presentation/widgets/sign_in_view_body.dart';
import 'package:fruit/features/home/presentation/views/main_view.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
         Navigator.pushNamed(context, MainView.routeName);
        }

        if (state is SignInFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is SignInLoading ? true : false,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
