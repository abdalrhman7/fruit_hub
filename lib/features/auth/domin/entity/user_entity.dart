class UserEntity {
  final String name;
  final String email;
  final String uid;

  UserEntity({
    required this.name,
    required this.email,
    required this.uid,
  });

  Map<String, String> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }
}
