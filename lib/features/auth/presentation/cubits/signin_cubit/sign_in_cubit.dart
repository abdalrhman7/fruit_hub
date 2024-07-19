import 'package:bloc/bloc.dart';
import 'package:fruit/features/auth/domin/entity/user_entity.dart';
import 'package:fruit/features/auth/domin/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.authRepo) : super(SignInInitial());
  final AuthRepo authRepo ;

  Future<void> signIn({required String email, required String password}) async {
    emit(SignInLoading());
    var result = await authRepo.signInWithEmailAndPassword(email: email, password: password);
    result.fold((l) {
      emit(SignInFailure(message: l.message));
    }, (r) {
      emit(SignInSuccess(userEntity: r));
    });
  }

}
