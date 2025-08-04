import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fruit_hup/features/cart/presentation/views/widgets/cart_item_proaduct.dart';
import 'package:fruit_hup/features/cart/presentation/views/widgets/custom_divider.dart';

class CartItemProaductLisView extends StatelessWidget {
  const CartItemProaductLisView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: context.read<CartCubit>().cartEntity.cartProaducts.length,
      itemBuilder:
          (context, index) => CartItemProaduct(
            cartItem: context.read<CartCubit>().cartEntity.cartProaducts[index],
          ),
      separatorBuilder: (context, index) => const CustomDivider(),
    );
  }
}
