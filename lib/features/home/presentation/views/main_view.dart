import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String id = 'home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: const [HomeView()]),
      bottomNavigationBar: CustomBottomNavigationBar(
        onChanged: (int value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
