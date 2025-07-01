import 'package:dartz/dartz.dart';
import 'package:fruit_hup/core/error/failure.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

abstract class ProaductRepo {
  Future<Either<Failure, List<ProaductEntity>>> getProaducts(String path);
  Future<Either<Failure, List<ProaductEntity>>> getTheBestSellingProaducts(String path);

}
