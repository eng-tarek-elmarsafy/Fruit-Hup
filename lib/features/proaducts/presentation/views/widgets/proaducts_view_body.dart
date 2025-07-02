import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/search_for.dart';
import 'package:fruit_hup/features/proaducts/presentation/views/widgets/custom_proaducts_app_bar.dart';
import 'package:fruit_hup/features/proaducts/presentation/views/widgets/fruit_bar.dart';
import 'package:fruit_hup/features/proaducts/presentation/views/widgets/hedar_fruit_bar.dart';

class ProaductsViewBody extends StatelessWidget {
  const ProaductsViewBody({super.key, required this.proaducts});
  final List<ProaductEntity> proaducts;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
              child: Column(
                children: [
                  CustomProaductsAppBar(),
                  SizedBox(height: 16),
                  SearchFor(),
                  SizedBox(height: 16),
                  HedarFruitBar(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(child: FruitBar(proaducts: proaducts)),
        ],
      ),
    );
  }
}
