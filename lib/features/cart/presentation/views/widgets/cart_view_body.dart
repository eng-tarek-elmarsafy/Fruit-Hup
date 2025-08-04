import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/widgets/custom_proaducts_app_bar.dart';
import 'package:fruit_hup/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fruit_hup/features/cart/presentation/views/widgets/cart_item_proaduct_list_view.dart';
import 'package:fruit_hup/features/cart/presentation/views/widgets/custom_divider.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: CustomAppBar(titlel: 'السلة', backIconVisibilty: true),
                ),
                const SizedBox(height: 16),
                Container(
                  color: AppColor.green200,
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'لديك ${context.read<CartCubit>().cartEntity.cartProaducts.length} منتجات في سله التسوق',
                        style: AppStyle.smallRegular,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child:
                context.read<CartCubit>().cartEntity.cartProaducts.isEmpty
                    ? const SizedBox.shrink()
                    : const CustomDivider(),
          ),
          const CartItemProaductLisView(),
          SliverToBoxAdapter(
            child:
                context.read<CartCubit>().cartEntity.cartProaducts.isEmpty
                    ? const SizedBox.shrink()
                    : const CustomDivider(),
          ),
          // const SliverToBoxAdapter(child: CustomDivider()),
        ],
      ),
    );
  }
}
