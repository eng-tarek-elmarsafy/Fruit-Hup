import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

class CartItemEntity {
  CartItemEntity({required this.proaductEntity, this.count = 0});

  final ProaductEntity proaductEntity;
  num count;
}
