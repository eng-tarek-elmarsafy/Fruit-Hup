import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

class FruitBarItem extends StatelessWidget {
  const FruitBarItem({super.key, required this.proaducts});

  final ProaductEntity proaducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xffF3F5F7),
          radius: 50,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Image.network(proaducts.imageUrl!),
          ),
        ),
        const SizedBox(height: 4),
        Text(proaducts.name, style: AppStyle.smallBold),
      ],
    );
  }
}
