import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/search_for.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(height: 16),
          SearchFor(),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
