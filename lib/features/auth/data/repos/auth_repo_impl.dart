import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/custom_exception.dart';
import 'package:fruit_hup/core/error/failure.dart';
import 'package:fruit_hup/core/services/firebase_auth_service.dart';
import 'package:fruit_hup/features/auth/data/models/user_model.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entitie.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.firebaseAuthService});

  final FirebaseAuthService firebaseAuthService;
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email,
        password,
        name,
      );
      var userEntity = UserEntity(
        name: user.displayName ?? '',
        uId: user.uid,
        email: email,
      );
      return right(userEntity);
    } on CustomException catch (e) {
      log('AuthRepoImpl.createUserWithEmailAndPassword Exception is $e');
      return left(ServerFailure(message: e.message));
    } catch (e) {
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
      return right(
        UserEntity(
          name: user.displayName ?? '',
          uId: user.uid,
          email: user.email!,
        ),
      );
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
    try {
      final user = await firebaseAuthService.signInWithGoogle();

      if (user == null) {
        return left(
          ServerFailure(
            message: 'تم إلغاء عملية تسجيل الدخول من قبل المستخدم.',
          ),
        );
      }

      final userEntity = UserModel.fromFirebaseUser(user);
      return right(userEntity);
    } on CustomException catch (e) {
      log('FirebaseAuthException in signInWithGoogle: - ${e.message}');
      return left(ServerFailure(message: 'فشل في تسجيل الدخول: ${e.message}'));
    } catch (e, stackTrace) {
      log('Unexpected error in signInWithGoogle: $e');
      log('Stack trace: $stackTrace');
      return left(
        ServerFailure(message: 'حدث خطأ غير متوقع. الرجاء المحاولة لاحقًا.'),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var resuilt = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(resuilt);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e, stackTrace) {
      log('====================== $e');
      log('================= $stackTrace');
      return left(
        ServerFailure(message: 'حدث خطأ غير متوقع. الرجاء المحاولة لاحقًا.'),
      );
    }
  }
}
