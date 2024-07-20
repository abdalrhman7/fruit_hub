import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit/core/errors/exceptions.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/core/services/firebase_auth_service.dart';
import 'package:fruit/features/auth/data/model/user_model.dart';
import 'package:fruit/features/auth/domin/entity/user_entity.dart';
import 'package:fruit/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: $e');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword: $e');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async{
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle: $e');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook()async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithFacebook: $e');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى'));
    }
  }


}
