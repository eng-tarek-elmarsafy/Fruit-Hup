import 'package:bloc/bloc.dart';
import 'package:fruit_hup/features/cart/domain/entities/cart_entity.dart';
import 'package:fruit_hup/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addProaduct(ProaductEntity proaduct) {
    bool cartIsExste = cartEntity.isExis(proaduct);
    if (cartIsExste) {
      
    } else {
      cartEntity.cartProaducts.add(
        CartItemEntity(proaductEntity: proaduct, count: 1),
      );
    }
  }
}
