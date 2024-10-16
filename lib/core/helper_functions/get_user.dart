import 'dart:convert';
import 'package:fruit/constants.dart';
import 'package:fruit/core/services/shared_preferences_singleton.dart';
import 'package:fruit/features/auth/data/model/user_model.dart';
import 'package:fruit/features/auth/domin/entity/user_entity.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}