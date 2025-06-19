import 'package:flutter/material.dart';
import 'package:fruit_hup/core/helper/is_arabic.dart';
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
          (index) => Padding(
            padding: EdgeInsets.only(
              right: isArabic() ? 0 : 8,
              left: isArabic() ? 8  : 0,
            ),
            child: const FeatureWidget(),
          ),
        ),
      ),
    );
  }
}
