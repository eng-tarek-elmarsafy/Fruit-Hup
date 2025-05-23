import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: 11,
      height: 11,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: isActive ? AppColor.green1_500 : AppColor.green500,
      ),
    );
  }
}
