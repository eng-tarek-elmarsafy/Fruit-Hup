import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/features/home/domain/entities/navigation_bar_entity.dart';

class ActiveItemNavigationBar extends StatelessWidget {
  const ActiveItemNavigationBar({super.key, required this.navigationBarEntity});
  final NavigationBarEntity navigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 245, 247),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColor.green1_500,
            child: SvgPicture.asset(navigationBarEntity.activeImage),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              navigationBarEntity.name,
              style: AppStyle.smallBold.copyWith(color: AppColor.green1_500),
            ),
          ),
        ],
      ),
    );
  }
}


