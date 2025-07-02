import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';

class HedarFruitBar extends StatelessWidget {
  const HedarFruitBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'منتجاتنا',
          style: AppStyle.basaBold.copyWith(color: Colors.black),
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.swap_vert)),
      ],
    );
  }
}
