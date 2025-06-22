import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/notification_icon.dart';

class BestSellAppBar extends StatelessWidget {
  const BestSellAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffF1F1F5)),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(17),
              child: Center(child: SvgPicture.asset(Assets.imageArrowBackSvg)),
            ),
          ),
        ),
        const Text('الأكثر مبيعًا', style: AppStyle.largeBold),
        const NotificationIcon(),
      ],
    );
  }
}
