import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entitie.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.name,
    required super.uId,
    required super.email,
    super.image,
  });

  factory UserModel.fromUserEntitiy(UserEntity user) {
    return UserModel(
      name: user.name,
      uId: user.uId,
      email: user.email,
      image: user.image,
    );
  }

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      uId: user.uid,
      email: user.email ?? '',
      image: user.photoURL,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      uId: json['uId'],
      email: json['email'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uId': uId, 'image': image};
  }
}
