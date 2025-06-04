import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hup/core/error/custom_exception.dart';
import 'package:fruit_hup/core/error/failure.dart';
import 'package:fruit_hup/core/helper/backend_endpoints.dart';
import 'package:fruit_hup/core/services/firebase_auth_service.dart';
import 'package:fruit_hup/core/services/firebase_firestore_service.dart';
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
      return right(UserModel.fromFirebaseUser(user));
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
      await addUser(userEntity);
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

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUser(userEntity);
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

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUser(userEntity);
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

  @override
  Future addUser(UserEntity user) async {
    firebaseFirestoreService.add(BackendEndpoints.addUserData, user.toMap());
  }

  void deleteUser(User? user) {
    if (user != null) {
      firebaseAuthService.deleteUser();
    }
  }
}
