import 'package:flutter/material.dart';
import 'package:fruit_hup/features/home/domain/entities/navigation_bar_entity.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/active_item_navigation_bar.dart';

class BottomNavigationBarItems extends StatelessWidget {
  const BottomNavigationBarItems({
    super.key,
    required this.isAcive,
    required this.navigationBarEntity,
  });

  final bool isAcive;
  final NavigationBarEntity navigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return isAcive
        ? ActiveItemNavigationBar(navigationBarEntity: navigationBarEntity)
        : InActiveItemNavigationBar(navigationBarEntity: navigationBarEntity);
  }
}
