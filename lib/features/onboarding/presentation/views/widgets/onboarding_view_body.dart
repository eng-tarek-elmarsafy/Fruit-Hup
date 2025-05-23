import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/custom_page_view.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late final PageController controller;
  int currentPage = 0;

  @override
  void initState() {
    controller = PageController();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(currentPage.toString());
    return Column(
      children: [Expanded(child: CustomPageView(controller: controller))],
    );
  }
}
