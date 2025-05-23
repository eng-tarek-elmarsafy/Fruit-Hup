import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/features/onboarding/presentation/manager/models/onboarding_view_model.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/onboarding_content.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({super.key, required this.onboardingViewModel});

  final OnboardingViewModel onboardingViewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * .5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  onboardingViewModel.onboardingBackgrondImage,
                  // width: MediaQuery.sizeOf(context).width,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(onboardingViewModel.image),
              ),
            ],
          ),
        ),
        const SizedBox(height: 64),
        OnboardingContent(onboardingViewModel: onboardingViewModel),
      ],
    );
  }
}
