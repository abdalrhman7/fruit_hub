import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  AuthRepoImpl(
      {required this.firebaseAuthService, required this.databaseService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uid: user.uid);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return Left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.createUserWithEmailAndPassword: $e');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthService.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uid: user.uid);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithEmailAndPassword: $e');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithGoogle: $e');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return Right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      await deleteUser(user);
      log('Exception in AuthRepoImpl.signInWithFacebook: $e');
      return Left(ServerFailure('حدث خطأ ما. الرجاء المحاولة مرة اخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: user.toMap(),
      documentId: user.uid,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var userData = await databaseService.getData(
        path: BackendEndpoint.getUserData, documentId: uid);
    return UserModel.fromJson(userData);
  }
}
