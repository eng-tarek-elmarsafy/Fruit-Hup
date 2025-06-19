import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/feature_widget.dart';

class ListVeiwFeatureWidget extends StatelessWidget {
  const ListVeiwFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: FeatureWidget(),
          ),
        ),
      ),
    );
  }
}
