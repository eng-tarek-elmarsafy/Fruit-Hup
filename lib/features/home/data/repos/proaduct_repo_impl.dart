import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/failure.dart';
import 'package:fruit_hup/core/services/firebase_firestore_service.dart';
import 'package:fruit_hup/features/home/data/models/product_model.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hup/features/home/domain/repos/proaduct_repo.dart';

class ProaductRepoImpl extends ProaductRepo {
  ProaductRepoImpl({required this.firebaseFirestoreService});

  final FirebaseFirestoreService firebaseFirestoreService;

  @override
  Future<Either<Failure, List<ProaductEntity>>> getProaducts(
    String path,
  ) async {
    try {
      var data =
          await firebaseFirestoreService.getData(path)
              as List<Map<String, dynamic>>;

      List<ProaductEntity> proaducts =
          data.map((e) => ProductModel.fromJson(e)).toList();

      return right(proaducts);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
