import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widgets/fruit_item.dart';

class FruitItemsGrid extends StatelessWidget {
  const FruitItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) => const FruitItem(),
    );
  }
}
