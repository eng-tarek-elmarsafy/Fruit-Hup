import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/helper/is_arabic.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/features/cart/domain/entities/cart_item_entity.dart';
import 'package:fruit_hup/features/cart/presentation/views/widgets/cart_action_add_or_dele.dart';

class CartItemProaduct extends StatelessWidget {
  const CartItemProaduct({super.key, required this.cartItem});
  final CartItemEntity cartItem;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Container(
            width: 100,
            height: 120,
            color: AppColor.gray200,
            child: Center(child: Image.asset(Assets.imageImageTest)),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: isArabic() ? 16 : 0,
                left: isArabic() ? 0 : 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        cartItem.proaductEntity.name,
                        style: AppStyle.smallBold,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: SvgPicture.asset(Assets.imageTrash),
                      ),
                    ],
                  ),
                  Text(
                    '${cartItem.proaductEntity.unitAmount} كم',
                    style: AppStyle.smallRegular.copyWith(
                      color: AppColor.orange500,
                    ),
                  ),
                  Row(
                    children: [
                      const CartActionAddOrDele(
                        backGroundColor: AppColor.green1_500,
                        icon: Icons.add,
                        iconColor: AppColor.gray50,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          cartItem.count.toString(),
                          style: AppStyle.basaBold.copyWith(
                            color: Colors.black,
                            fontSize: 19,
                          ),
                        ),
                      ),

                      const CartActionAddOrDele(
                        backGroundColor: AppColor.gray300,
                        icon: Icons.remove,
                        iconColor: AppColor.gray50,
                      ),
                      const Spacer(),
                      Text(
                        '60 جنيه ',
                        style: AppStyle.basaBold.copyWith(
                          color: AppColor.orange500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
