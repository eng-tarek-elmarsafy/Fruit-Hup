import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/features/onboarding/presentation/manager/models/onboarding_view_model.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, required this.onboardingViewModel});
  final OnboardingViewModel onboardingViewModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 37),
      child: Column(
        children: [
          onboardingViewModel.title,
          const SizedBox(height: 24),
          Text(
            onboardingViewModel.subtitle,
            style: AppStyle.smallBold.copyWith(color: const Color(0xff4E5456)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
