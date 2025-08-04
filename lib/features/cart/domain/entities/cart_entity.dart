import 'package:fruit_hup/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

class CartEntity {
  CartEntity(this.cartProaducts);

  List<CartItemEntity> cartProaducts;

  bool isExis(ProaductEntity proaduct) {
    for (var pro in cartProaducts) {
      if (pro.proaductEntity == proaduct) {
        return true;
      }
    }
    return false;
  }
}
