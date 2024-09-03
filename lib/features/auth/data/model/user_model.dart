import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/features/auth/domin/entity/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.name, required super.email, required super.uid});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      uid: map['uid'] ?? '',
    );
  }

  // copyWith({String? name, String? email, String? uid}) {
  //   return UserModel(
  //     name: name ?? this.name,
  //     email: email ?? this.email,
  //     uid: uid ?? this.uid,
  //   );
  // }
}