import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/features/best_sell.dart/presentation/views/best_sell_view.dart';

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
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, BestSellView.id);
            },
            child: const Text('المزيد', style: AppStyle.smallRegular),
          ),
        ],
      ),
    );
  }
}
