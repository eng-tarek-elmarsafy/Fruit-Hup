class UserEntity {
  UserEntity({
    required this.name,
    required this.uId,
    required this.email,
    this.image,
  });

  final String name;
  final String uId;
  final String email;
  final String? image;
}
