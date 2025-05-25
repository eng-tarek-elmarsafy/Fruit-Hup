import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/generated/l10n.dart';

class ForgotPasswordTextButton extends StatelessWidget {
  const ForgotPasswordTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log(S.of(context).ForgotPassword);
      },
      child: Text(
        S.of(context).ForgotPassword,
        style: AppStyle.smallBold.copyWith(color: AppColor.green1_600),
      ),
    );
  }
}
