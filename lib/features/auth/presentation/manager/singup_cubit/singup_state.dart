part of 'singup_cubit.dart';

@immutable
sealed class SingupState {}

final class SingupInitial extends SingupState {}

final class SingupLoading extends SingupState {}

final class SingupSuccess extends SingupState {
  SingupSuccess({required this.userEntity});

  final UserEntity userEntity;
}

final class SingupFailure extends SingupState {
  SingupFailure({required this.message});

  final String message;
}
