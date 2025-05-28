import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_hup/core/helper/get_it_setup.dart';
import 'package:fruit_hup/core/helper/on_generate_route_function.dart';
import 'package:fruit_hup/core/services/shared_preferences.dart';
import 'package:fruit_hup/core/services/simple_bloc_observer.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/features/splash/presentation/views/splash_view.dart';
import 'package:fruit_hup/firebase_options.dart';
import 'package:fruit_hup/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Prefs.inti();
  Bloc.observer = SimpleBlocObserver();
  setup();
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.green1_500),
      ),
      locale: const Locale('ar'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.id,
    );
  }
}
