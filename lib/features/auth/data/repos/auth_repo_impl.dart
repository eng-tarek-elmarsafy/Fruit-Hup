import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/custom_exception.dart';
import 'package:fruit_hup/core/error/failure.dart';
import 'package:fruit_hup/core/services/firebase_auth_service.dart';
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
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: 'حدث خطأ ما. الرجاء المحاولة مرة اخرى.'),
      );
    }
  }
}
