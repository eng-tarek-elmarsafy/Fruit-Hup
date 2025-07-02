import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/notification_icon.dart';

class CustomProaductsAppBar extends StatelessWidget {
  const CustomProaductsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        Text('المنتجات', style: AppStyle.largeBold),
        Spacer(),
        NotificationIcon(),
      ],
    );
  }
}
