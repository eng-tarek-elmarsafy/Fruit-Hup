import 'package:flutter/material.dart';

class OnboardingViewModel {
  OnboardingViewModel({
    required this.onboardingBackgrondImage,
    required this.image,
    required this.subtitle,
    required this.title,
  });

  final String onboardingBackgrondImage, image;
  final String subtitle;
  final Widget title;
}