import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';

class SignUpPromptRow extends StatelessWidget {
  const SignUpPromptRow({
    super.key,
    required this.text1,
    required this.text2,
    required this.goTo,
  });
  final String text1, text2;
  final VoidCallback goTo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1, style: AppStyle.basaBold.copyWith(color: AppColor.gray400)),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: goTo,
          child: Text(
            text2,
            style: AppStyle.basaBold.copyWith(color: AppColor.green1_500),
          ),
        ),
      ],
    );
  }
}
