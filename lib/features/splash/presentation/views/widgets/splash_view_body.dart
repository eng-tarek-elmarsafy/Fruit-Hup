import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hup/constens.dart';
import 'package:fruit_hup/core/helper/is_arabic.dart';
import 'package:fruit_hup/core/services/firebase_auth_service.dart';
import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hup/features/home/presentation/views/main_view.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNaviagtion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment:
              isArabic() ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [SvgPicture.asset(Assets.imagePlan)],
        ),
        SvgPicture.asset(Assets.imageLogo),
        SvgPicture.asset(Assets.imageSplashBottom, fit: BoxFit.fill),
      ],
    );
  }

  void excuteNaviagtion() {
    Future.delayed(const Duration(seconds: 3), () {
      if (FirebaseAuthService.isLogedin()) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, MainView.id);
      } else if (Prefs.getBool(kIsOnboardingSeen)) {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, LoginView.id);
      } else {
        if (!mounted) return;
        Navigator.pushReplacementNamed(context, OnboardingView.id);
      }
    });
  }
}
