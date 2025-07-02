import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(color: AppColor.gray300, height: 20);
  }
}