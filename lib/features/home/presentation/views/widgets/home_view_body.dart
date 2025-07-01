import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/home_view_app_bar.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/fruit_items_grid.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/hedar_best_sell.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/list_veiw_feature_widget.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/search_for.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.proaducts});
  final List<ProaductEntity> proaducts;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeViewAppBar(),
                  SizedBox(height: 16),
                  SearchFor(),
                  SizedBox(height: 12),
                  ListVeiwFeatureWidget(),
                  SizedBox(height: 12),
                  HedarBestSell(),
                  SizedBox(height: 12),
                ],
              ),
            ),
            FruitItemsGrid(proaducts: proaducts),
          ],
        ),
      ),
    );
  }
}
