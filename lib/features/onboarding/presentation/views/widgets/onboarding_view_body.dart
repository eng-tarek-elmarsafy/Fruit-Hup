import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hup/constens.dart';
import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/custom_page_view.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/widgets/dot_indicator.dart';
import 'package:fruit_hup/generated/l10n.dart';

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
    controller.addListener(_currentPageListener);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _currentPageListener() {
    setState(() {
      currentPage = controller.page?.round() ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    log(currentPage.toString());
    return Stack(
      children: [
        CustomPageView(controller: controller),
        currentPage == 0
            ? SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextButton(
                      child: Text(
                        S.of(context).Skip,
                        style: AppStyle.smallRegular,
                      ),
                      onPressed: () {
                        log(S.of(context).Skip);
                        Prefs.setBool(kIsOnboardingSeen, true);
                        Navigator.pushReplacementNamed(context, LoginView.id);
                      },
                    ),
                  ),
                ],
              ),
            )
            : const SizedBox.shrink(),
        Positioned(
          top: MediaQuery.sizeOf(context).height * .76,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const DotIndicator(isActive: true),
              const SizedBox(width: 10),
              DotIndicator(isActive: currentPage == 1),
            ],
          ),
        ),
        currentPage == 1
            ? Positioned(
              top: MediaQuery.sizeOf(context).height * .801,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  title: S.of(context).GetStarted,
                  onPressed: () {
                    Prefs.setBool(kIsOnboardingSeen, true);
                    Navigator.pushReplacementNamed(context, LoginView.id);
                  },
                ),
              ),
            )
            : const SizedBox.shrink(),
      ],
    );
  }
}
