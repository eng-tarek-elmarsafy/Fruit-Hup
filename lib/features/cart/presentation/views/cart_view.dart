import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widgets/custom_proaducts_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartViewBody();
  }
}

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomAppBar(titlel: 'السلة', backIconVisibilty: true),
          ),
        ],
      ),
    );
  }
}
