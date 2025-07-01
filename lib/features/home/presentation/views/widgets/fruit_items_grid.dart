import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widgets/fruit_item.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

class FruitItemsGrid extends StatefulWidget {
  const FruitItemsGrid({super.key, required this.proaducts});
  final List<ProaductEntity> proaducts;
  @override
  State<FruitItemsGrid> createState() => _FruitItemsGridState();
}

class _FruitItemsGridState extends State<FruitItemsGrid> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: widget.proaducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder:
          (context, index) => FruitItem(proaduct: widget.proaducts[index]),
    );
  }
}
