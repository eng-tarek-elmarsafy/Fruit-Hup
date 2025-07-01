import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/constens.dart';
import 'package:fruit_hup/core/error/custom_exception.dart';
import 'package:fruit_hup/core/error/failure.dart';
import 'package:fruit_hup/core/helper/backend_endpoints.dart';
import 'package:fruit_hup/core/services/firebase_auth_service.dart';
import 'package:fruit_hup/core/services/firebase_firestore_service.dart';
import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/features/auth/data/models/user_model.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entitie.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({
    required this.firebaseFirestoreService,
    required this.firebaseAuthService,
  });
  final FirebaseFirestoreService firebaseFirestoreService;
  final FirebaseAuthService firebaseAuthService;
  //MARK:create account
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
        name,
      );
      var userEntity = UserEntity(
        name: user.displayName ?? name,
        uId: user.uid,
        email: email,
      );
      await addUser(userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      log('AuthRepoImpl.createUserWithEmailAndPassword Exception is $e');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      deleteUser(user);
      log('AuthRepoImpl.createUserWithEmailAndPassword Exception is $e');
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  //MARK:sign email and pass
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email,
        password,
      );

      var userData = await getUserData(user.uid);
      await saveUserData(userData);
      return right(userData);
    } on CustomException catch (e) {
      log('AuthRepoImpl.signInWithEmailAndPassword Exception is $e');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('AuthRepoImpl.signInWithEmailAndPassword Exception is $e');
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }

  //MARK:Googl
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();

      if (user == null) {
        return left(
          ServerFailure(
            message: 'تم إلغاء عملية تسجيل الدخول من قبل المستخدم.',
          ),
        );
      }

      final userEntity = UserModel.fromFirebaseUser(user);

      bool isUserExist = await firebaseFirestoreService.checkIfDataExists(
        BackendEndpoints.isUserExist,
        user.uid,
      );
      if (isUserExist) {
        var userEntity = await getUserData(user.uid);
        await saveUserData(userEntity);
        return right(userEntity);
      } else {
        await addUser(userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      log('FirebaseAuthException in signInWithGoogle: - ${e.message}');
      return left(ServerFailure(message: 'فشل في تسجيل الدخول: ${e.message}'));
    } catch (e, stackTrace) {
      deleteUser(user);
      log('Unexpected error in signInWithGoogle: $e');
      log('Stack trace: $stackTrace');
      return left(
        ServerFailure(message: 'حدث خطأ غير متوقع. الرجاء المحاولة لاحقًا.'),
      );
    }
  }

  //MARK:Facebook
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);

      bool isUserExist = await firebaseFirestoreService.checkIfDataExists(
        BackendEndpoints.isUserExist,
        user.uid,
      );
      if (isUserExist) {
        var userEntity = await getUserData(user.uid);
        await saveUserData(userEntity);
        return right(userEntity);
      } else {
        await addUser(userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return left(ServerFailure(message: e.toString()));
    } catch (e, stackTrace) {
      deleteUser(user);
      log('====================== $e');
      log('================= $stackTrace');
      return left(
        ServerFailure(message: 'حدث خطأ غير متوقع. الرجاء المحاولة لاحقًا.'),
      );
    }
  }

  //MARK:Apple
  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);

      bool isUserExist = await firebaseFirestoreService.checkIfDataExists(
        BackendEndpoints.isUserExist,
        user.uid,
      );
      if (isUserExist) {
        var userEntity = await getUserData(user.uid);
        await saveUserData(userEntity);
        return right(userEntity);
      } else {
        await addUser(userEntity);
      }
      return right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return left(ServerFailure(message: e.toString()));
    } catch (e, stackTrace) {
      deleteUser(user);
      log('====================== $e');
      log('================= $stackTrace');
      return left(
        ServerFailure(message: 'حدث خطأ غير متوقع. الرجاء المحاولة لاحقًا.'),
      );
    }
  }

  //MARK:Get user
  @override
  Future<UserEntity> getUserData(String uId) async {
    var data = await firebaseFirestoreService.getData(
      BackendEndpoints.getUserData,
      uId: uId,
    );

    UserEntity userEntity = UserModel.fromJson(data);
    return userEntity;
  }

  //MARK:Add user
  @override
  Future addUser(UserEntity user) async {
    firebaseFirestoreService.addData(
      BackendEndpoints.addUserData,
      user.uId,
      UserModel.fromUserEntitiy(user).toMap(),
    );
  }

  //MARK:Delete user
  void deleteUser(User? user) {
    if (user != null) {
      firebaseAuthService.deleteUser();
    }
  }

  @override
  Future saveUserData(UserEntity user) async {
    var jsonData = UserModel.fromUserEntitiy(user).toMap();
    await Prefs.setString(kUserData, jsonEncode(jsonData));
  }
}
