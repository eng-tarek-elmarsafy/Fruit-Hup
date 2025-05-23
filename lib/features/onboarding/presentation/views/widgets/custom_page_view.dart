import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/features/onboarding/presentation/manager/models/onboarding_view_model.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/onboarding_item.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/onboarding_title.dart';
import 'package:fruit_hup/generated/l10n.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({super.key, required this.controller});
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        OnboardingItem(
          onboardingViewModel: OnboardingViewModel(
            onboardingBackgrondImage: Assets.imageOnboardingBackgrund1,
            image: Assets.imageOnboarding1,
            subtitle: S.of(context).onboardingSuptitil1,
            title: const OnbordingTitle1(),
          ),
        ),
        OnboardingItem(
          onboardingViewModel: OnboardingViewModel(
            onboardingBackgrondImage: Assets.imageOnboardingBackgrund2,
            image: Assets.imageOnboarding2,
            subtitle: S.of(context).onboardingSuptitil2,
            title: Text(S.of(context).title2, style: AppStyle.heading5Bold),
          ),
        ),
      ],
    );
  }
}
