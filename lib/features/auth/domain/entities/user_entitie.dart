class UserEntity {
  UserEntity({required this.name, required this.uId, required this.email});

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }

  final String name;
  final String uId;
  final String email;
}
