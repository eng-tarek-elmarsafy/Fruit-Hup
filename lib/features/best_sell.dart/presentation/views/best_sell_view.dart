import 'package:flutter/material.dart';
import 'package:fruit_hup/features/best_sell.dart/presentation/views/widgets/best_sell_view_body.dart';

class BestSellView extends StatelessWidget {
  const BestSellView({super.key});
  static const String id = 'Best_sell';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: BestSellViewBody());
  }
}
