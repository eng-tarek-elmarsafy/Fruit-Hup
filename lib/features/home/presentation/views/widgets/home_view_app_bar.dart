import 'package:flutter/material.dart';
import 'package:fruit_hup/core/helper/get_user_data.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/features/home/presentation/views/widgets/notification_icon.dart';
import 'package:fruit_hup/generated/l10n.dart';

class HomeViewAppBar extends StatelessWidget {
  const HomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading:
          getUserData().image == null
              ? Image.asset(Assets.imageProfile)
              : Image.network(getUserData().image!),
      title: Text(S.of(context).GoodMorning, style: AppStyle.basaRegular),
      subtitle: Text(
        getUserData().name,
        style: AppStyle.basaBold.copyWith(color: Colors.black),
      ),
      trailing: const NotificationIcon(),
    );
  }
}
