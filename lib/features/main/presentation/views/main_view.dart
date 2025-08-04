import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:fruit_hup/features/cart/presentation/views/cart_view.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:fruit_hup/features/home/presentation/views/home_view.dart';
import 'package:fruit_hup/features/proaducts/presentation/views/proaducts_view.dart';

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
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: const [
            HomeView(),
            ProaductsView(),
            CartView(),
            Placeholder(),
          ],
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          onChanged: (int value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
      ),
    );
  }
}
