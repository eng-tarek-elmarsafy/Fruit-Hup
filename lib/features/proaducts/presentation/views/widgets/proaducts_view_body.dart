import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/search_for.dart';
import 'package:fruit_hup/features/proaducts/presentation/views/widgets/custom_proaducts_app_bar.dart';
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
          SliverToBoxAdapter(
            child: SafeArea(
              child: Column(
                children: [
                  const CustomProaductsAppBar(),
                  const SizedBox(height: 16),
                  const SearchFor(),
                  const SizedBox(height: 16),
                  HedarFruitBar(proaduct: proaducts),
                ],
              ),
            ),
          ),

          // SliverToBoxAdapter(child: FruitBar(proaducts: proaducts)),
          const ProaductGridViewBlocBuilder(),
        ],
      ),
    );
  }
}
