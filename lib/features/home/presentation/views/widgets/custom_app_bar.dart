import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/notification_icon.dart';
import 'package:fruit_hup/generated/l10n.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: Image.asset(Assets.imageProfile),
      title: Text(S.of(context).GoodMorning, style: AppStyle.basaRegular),
      subtitle: Text(
        'أحمد مصطفي',
        style: AppStyle.basaBold.copyWith(color: Colors.black),
      ),
      trailing: const NotificationIcon(),
    );
  }
}
