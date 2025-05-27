import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entitie.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'singup_state.dart';

class SingupCubit extends Cubit<SingupState> {
  SingupCubit(this.authRepo) : super(SingupInitial());

  final AuthRepo authRepo;

  createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SingupLoading());
    var resuilt = await authRepo.createUserWithEmailAndPassword(
      email,
      password,
      name,
    );
    resuilt.fold(
      (failure) => emit(SingupFailure(message: failure.message)),
      (user) => emit(SingupSuccess(userEntity: user)),
    );
  }
}
