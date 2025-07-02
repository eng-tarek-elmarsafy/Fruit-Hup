import 'package:flutter/material.dart';
import 'package:fruit_hup/features/proaducts/presentation/views/widgets/custom_proaducts_app_bar.dart';

class ProaductsViewBody extends StatelessWidget {
  const ProaductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SafeArea(child: CustomProaductsAppBar())),
          
        ],
      ),
    );
  }
}
