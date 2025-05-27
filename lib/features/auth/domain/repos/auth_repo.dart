import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/failure.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entitie.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntitie>> createUserWithEmailAndPassword(
    String email,
    String password,
  );
}
