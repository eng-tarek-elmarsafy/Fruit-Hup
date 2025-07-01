import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const String id = 'home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeView(),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
