import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widgets/fruit_item.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

class ProaductGrid extends StatefulWidget {
  const ProaductGrid({super.key, required this.proaducts});
  final List<ProaductEntity> proaducts;
  @override
  State<ProaductGrid> createState() => _ProaductGridState();
}

class _ProaductGridState extends State<ProaductGrid> {
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
