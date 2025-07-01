import 'package:bloc/bloc.dart';
import 'package:fruit_hup/core/helper/backend_endpoints.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hup/features/home/domain/repos/proaduct_repo.dart';
import 'package:meta/meta.dart';

part 'proaducts_state.dart';

class ProaductsCubit extends Cubit<ProaductsState> {
  ProaductsCubit(this.proaductRepo) : super(ProaductsInitial());
  final ProaductRepo proaductRepo;

  Future<void> getProaducts() async {
    emit(ProaductsLoading());

    var resilt = await proaductRepo.getProaducts(BackendEndpoints.getProaduct);

    resilt.fold(
      (failure) => emit(ProaductsFailuer(err: failure.message)),
      (listOfProaduct) => emit(ProaductsSuccess(proaducts: listOfProaduct)),
    );
  }

  Future<void> getTheBestSellingProaducts() async {
    var result = await proaductRepo.getTheBestSellingProaducts(
      BackendEndpoints.getProaduct,
    );
    result.fold(
      (failure) => emit(ProaductsFailuer(err: failure.message)),
      (listOfProaduct) => emit(ProaductsSuccess(proaducts: listOfProaduct)),
    );
  }
}
