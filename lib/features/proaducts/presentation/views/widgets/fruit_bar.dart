import 'package:flutter/material.dart';
import 'package:fruit_hup/core/helper/is_arabic.dart';
import 'package:fruit_hup/features/home/domain/entities/product_entity.dart';
import 'package:fruit_hup/features/proaducts/presentation/views/widgets/fruit_bar_item.dart';

class FruitBar extends StatelessWidget {
  const FruitBar({super.key, required this.proaducts});
  final List<ProaductEntity> proaducts;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            proaducts.map((e) {
              return Padding(
                padding: EdgeInsets.only(
                  right: isArabic() ? 0 : 9,
                  left: isArabic() ? 9 : 0,
                ),
                child: FruitBarItem(proaducts: e),
              );
            }).toList(),
      ),
    );
  }
}
