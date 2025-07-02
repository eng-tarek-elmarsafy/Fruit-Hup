import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/widgets/custom_proaducts_app_bar.dart';
import 'package:fruit_hup/features/cart/presentation/views/widgets/cart_item_proaduct_list_view.dart';
import 'package:fruit_hup/features/cart/presentation/views/widgets/custom_divider.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

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
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'لديك 3 منتجات في سله التسوق',
                        style: AppStyle.smallRegular,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SliverToBoxAdapter(child: CustomDivider()),
          const CartItemProaductLisView(),
          const SliverToBoxAdapter(child: CustomDivider()),
        ],
      ),
    );
  }
}
