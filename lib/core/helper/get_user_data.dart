import 'dart:convert';

import 'package:fruit_hup/constens.dart';
import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/features/auth/data/models/user_model.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entitie.dart';

UserEntity getUserData() {
  var jsonUserData = jsonDecode(Prefs.getString(kUserData));
  return UserModel.fromJson(jsonUserData);
}
