part of 'proaducts_cubit.dart';

@immutable
sealed class ProaductsState {}

final class ProaductsInitial extends ProaductsState {}

final class ProaductsLoading extends ProaductsState {}

final class ProaductsFailuer extends ProaductsState {
  ProaductsFailuer({required this.err});

  final String err;
}

final class ProaductsSuccess extends ProaductsState {}
