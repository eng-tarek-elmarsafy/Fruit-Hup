import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/utils/assets.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 243, 245, 247),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7.5),
            child: Column(
              children: [
                const SizedBox(height: 17),
                Image.asset(Assets.imageImageTest),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text('فراولة', style: AppStyle.smallBold),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '30جنية',
                            style: AppStyle.smallBold.copyWith(
                              color: AppColor.orange500,
                            ),
                          ),
                          TextSpan(
                            text: ' / ',
                            style: AppStyle.smallBold.copyWith(
                              color: AppColor.orange300,
                            ),
                          ),
                          TextSpan(
                            text: 'الكيلو',
                            style: AppStyle.smallBold.copyWith(
                              color: AppColor.orange300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: AppColor.green1_500,
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Color(0xffffffff),
                            // size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
