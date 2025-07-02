import 'package:flutter/material.dart';
import 'package:fruit_hup/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hup/features/auth/presentation/views/singup_view.dart';
import 'package:fruit_hup/features/best_sell.dart/presentation/views/best_sell_view.dart';
import 'package:fruit_hup/features/home/presentation/views/main_view.dart';
import 'package:fruit_hup/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:fruit_hup/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SplashView.id:
      return MaterialPageRoute(builder: (context) => const SplashView());

    case OnboardingView.id:
      return MaterialPageRoute(builder: (context) => const OnboardingView());

    case LoginView.id:
      return MaterialPageRoute(builder: (context) => const LoginView());

    case SingUpView.id:
      return MaterialPageRoute(builder: (context) => const SingUpView());
    case MainView.id:
      return MaterialPageRoute(builder: (context) => const MainView());

    case BestSellView.id:
      return MaterialPageRoute(builder: (context) => const BestSellView());

    default:
      return MaterialPageRoute(
        builder:
            (context) =>
                const Scaffold(body: Center(child: Text('Route not found'))),
      );
  }
}
