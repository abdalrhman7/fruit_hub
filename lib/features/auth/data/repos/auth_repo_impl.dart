import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit/core/errors/exceptions.dart';
import 'package:fruit/core/errors/failures.dart';
import 'package:fruit/core/services/data_service.dart';
import 'package:fruit/core/services/firebase_auth_service.dart';
import 'package:fruit/core/utils/backend_endpoint.dart';
import 'package:fruit/features/auth/data/model/user_model.dart';
import 'package:fruit/features/auth/domin/entity/user_entity.dart';
import 'package:fruit/features/auth/domin/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({required this.firebaseAuthService , required this.databaseService});

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
      var userEntity = UserModel.fromFirebaseUser(user);
      userEntity = userEntity.copyWith(name: name);
      addUserData(user: userEntity);
      return Right(userEntity);
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

  @override
  Future addUserData({required UserEntity user})async {
    await databaseService.addData(path: BackendEndpoint.addUserData, data: user.toMap());
  }




}
