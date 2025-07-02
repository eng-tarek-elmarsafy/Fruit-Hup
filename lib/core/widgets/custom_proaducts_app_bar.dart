import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/notification_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.backIconVisibilty = false,
    this.notificationIconVisibilty = false,
    required this.titlel,
  });
  final bool backIconVisibilty;
  final bool notificationIconVisibilty;
  final String titlel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: backIconVisibilty,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        Spacer(flex: backIconVisibilty ? 6 : 8),
        Text(titlel, style: AppStyle.largeBold),

        Spacer(flex: notificationIconVisibilty ? 6 : 8),
        Visibility(
          visible: notificationIconVisibilty,
          child: const NotificationIcon(),
        ),
      ],
    );
  }
}
