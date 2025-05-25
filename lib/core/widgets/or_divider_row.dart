import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/generated/l10n.dart';

class OrDividerRow extends StatelessWidget {
  const OrDividerRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(child: Divider(color: Color(0xffDDDFDF))),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            S.of(context).Or,
            style: AppStyle.smallBold.copyWith(color: AppColor.gray950),
          ),
        ),
        const Expanded(child: Divider(color: Color(0xffDDDFDF))),
        const SizedBox(height: 16),
      ],
    );
  }
}
