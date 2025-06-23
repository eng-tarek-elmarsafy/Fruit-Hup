import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entitie.dart';

class UserModel extends UserEntity {
  factory UserModel.fromUserEntitiy(UserEntity user) {
    return UserModel(name: user.name, uId: user.uId, email: user.email);
  }
  UserModel({required super.name, required super.uId, required super.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      uId: user.uid,
      email: user.email ?? '',
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      uId: json['uId'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'uId': uId};
  }
}
