import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/auth/domain/entities/user_entitie.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  signInWithEmailAndPassword(String email, String password) async {
    emit(LoginLoading());
    var resuilt = await authRepo.signInWithEmailAndPassword(email, password);
    resuilt.fold(
      (failuer) => emit(LoginFailure(message: failuer.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }

  signInWithGoogle() async {
    emit(LoginLoading());
    var resuilt = await authRepo.signInWithGoogle();

    resuilt.fold(
      (failuer) => emit(LoginFailure(message: failuer.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }

  signInWithFacebook() async {
    emit(LoginLoading());
    var resuilt = await authRepo.signInWithFacebook();

    resuilt.fold(
      (failuer) => emit(LoginFailure(message: failuer.message)),
      (user) => emit(LoginSuccess(userEntity: user)),
    );
  }
}
