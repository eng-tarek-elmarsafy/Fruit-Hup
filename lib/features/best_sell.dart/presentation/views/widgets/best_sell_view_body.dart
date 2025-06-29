import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/widgets/fruit_item.dart';
import 'package:fruit_hup/features/best_sell.dart/presentation/views/widgets/best_sell_app_bar.dart';

class BestSellViewBody extends StatelessWidget {
  const BestSellViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SafeArea(child: BestSellAppBar())),
          const SliverToBoxAdapter(
            child: Text('الأكثر مبيعًا', style: AppStyle.largeBold),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          SliverGrid.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 16,
              childAspectRatio: 163 / 214,
            ),
            itemBuilder: (context, index) => const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
