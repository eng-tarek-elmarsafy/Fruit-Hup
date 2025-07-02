import 'package:fruit_hup/core/function/get_dummu_proaduct.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

List<ProaductEntity> getListOfDummyProducts() {
  return List.generate(10, (index) => getDummyProaduct());
}
