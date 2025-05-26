import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/assets.dart';

class CustomChackBox extends StatefulWidget {
  const CustomChackBox({super.key});

  @override
  State<CustomChackBox> createState() => _CustomChackBoxState();
}

class _CustomChackBoxState extends State<CustomChackBox> {
  bool isChacked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChacked = !isChacked;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: isChacked ? AppColor.green1_500 : const Color(0xffffffff),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: isChacked ? AppColor.green1_500 : const Color(0xffDDDFDF),
            width: 1,
          ),
        ),
        child: Center(child: SvgPicture.asset(Assets.imageCheckIcon)),
      ),
    );
  }
}
