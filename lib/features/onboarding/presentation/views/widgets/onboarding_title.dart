import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/generated/l10n.dart';

class OnbordingTitle1 extends StatelessWidget {
  const OnbordingTitle1({super.key});
  // final OnboardingViewModel onboardingViewModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).hello, style: AppStyle.heading5Bold),
        Text(
          S.of(context).HUB,
          style: AppStyle.heading5Bold.copyWith(color: AppColor.orange500),
        ),
        Text(
          S.of(context).Fruit,
          style: AppStyle.heading5Bold.copyWith(color: AppColor.green800),
        ),
      ],
    );
  }
}
