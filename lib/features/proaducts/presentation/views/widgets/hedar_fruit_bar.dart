import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';

class HedarFruitBar extends StatelessWidget {
  const HedarFruitBar({super.key, required this.proaduct});
  final List<ProaductEntity> proaduct;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${proaduct.length} نتائج',
          style: AppStyle.basaBold.copyWith(color: Colors.black),
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.swap_vert)),
      ],
    );
  }
}
