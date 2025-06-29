import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widgets/fruit_item.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hup/features/home/presentation/manager/proaducts_cubit/proaducts_cubit.dart';

class FruitItemsGrid extends StatefulWidget {
  const FruitItemsGrid({super.key});

  @override
  State<FruitItemsGrid> createState() => _FruitItemsGridState();
}

class _FruitItemsGridState extends State<FruitItemsGrid> {
  @override
  Widget build(BuildContext context) {
    List<ProaductEntity> proaducts = context.read<ProaductsCubit>().proaducts;
    return SliverGrid.builder(
      itemCount: proaducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) => FruitItem(proaduct: proaducts[index]),
    );
  }
}
