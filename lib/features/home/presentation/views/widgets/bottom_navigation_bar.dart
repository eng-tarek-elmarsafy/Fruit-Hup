import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/features/home/domain/entities/navigation_bar_entity.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/bottom_navigation_bar_items.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onChanged});
  final ValueChanged<int> onChanged;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.gray500,
            offset: Offset(0, -2),
            blurRadius: 7,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
              navigationBarIcons.asMap().entries.map((entry) {
                var index = entry.key;
                var e = entry.value;
                return GestureDetector(
                  onTap: () {
                    selectedTabIndex = index;
                    widget.onChanged(index);
                    setState(() {});
                  },
                  child: BottomNavigationBarItems(
                    isAcive: selectedTabIndex == index,
                    navigationBarEntity: e,
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
