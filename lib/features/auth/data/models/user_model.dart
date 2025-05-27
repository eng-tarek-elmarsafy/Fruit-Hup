import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entitie.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.uId, required super.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      uId: user.uid,
      email: user.email ?? '',
    );
  }
}
