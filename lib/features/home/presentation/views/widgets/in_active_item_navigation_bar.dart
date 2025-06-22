import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hup/features/home/domain/entities/navigation_bar_entity.dart';

class InActiveItemNavigationBar extends StatelessWidget {
  const InActiveItemNavigationBar({
    super.key,
    required this.navigationBarEntity,
  });
  final NavigationBarEntity navigationBarEntity;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(navigationBarEntity.notActiveImage);
  }
}