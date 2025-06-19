import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';

class HedarBestSell extends StatelessWidget {
  const HedarBestSell({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'الأكثر مبيعًا',
            style: AppStyle.basaBold.copyWith(color: Colors.black),
          ),
          const Text('المزيد', style: AppStyle.smallRegular),
        ],
      ),
    );
  }
}
