import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_style.dart';

AppBar authCustomAppBar({
    required BuildContext context,
    required String title,
  }) {
    return AppBar(
      backgroundColor: const Color(0xffffffff),
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(title, style: AppStyle.largeBold),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
    );
  }