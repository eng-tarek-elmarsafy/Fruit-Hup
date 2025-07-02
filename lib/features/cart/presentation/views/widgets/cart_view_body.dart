import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/helper/is_arabic.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/core/widgets/custom_proaducts_app_bar.dart';

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
          const CartItemProaductLisView(),
        ],
      ),
    );
  }
}

class CartItemProaductLisView extends StatelessWidget {
  const CartItemProaductLisView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) => const CartItemProaduct(),
      separatorBuilder:
          (context, index) => const Divider(color: AppColor.gray300),
    );
  }
}

class CartItemProaduct extends StatelessWidget {
  const CartItemProaduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 100,
          height: 130,
          color: AppColor.gray300,
          child: Center(child: Image.asset(Assets.imageImageTest)),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              right: isArabic() ? 16 : 0,
              left: isArabic() ? 0 : 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text('بطيخ', style: AppStyle.smallBold),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.imageTrash),
                    ),
                  ],
                ),
                Text(
                  '3 كم',
                  style: AppStyle.smallRegular.copyWith(
                    color: AppColor.orange500,
                  ),
                ),
                Row(children: [],)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
