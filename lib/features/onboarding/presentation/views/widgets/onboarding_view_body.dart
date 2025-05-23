import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/features/onboarding/presentation/manager/models/onboarding_view_model.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/onboarding_item.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/onboarding_title.dart';
import 'package:fruit_hup/generated/l10n.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return OnboardingItem(
      onboardingViewModel: OnboardingViewModel(
        onboardingBackgrondImage: Assets.imageOnboardingBackgrund1,
        image: Assets.imageOnboarding1,
        subtitle: S.of(context).onboardingSuptitil,
        title: const OnbordingTitle1(),
      ),
    );
  }
}





