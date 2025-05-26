import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/custom_chack_box.dart';
import 'package:fruit_hup/generated/l10n.dart';

class TermsAndConditionsAgreementRow extends StatelessWidget {
  const TermsAndConditionsAgreementRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomChackBox(),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: S.of(context).ByCreatingAccountYouAgreeTo,
                  style: AppStyle.smallBold.copyWith(color: AppColor.gray400),
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: S.of(context).OurTermsAndConditions,
                  style: AppStyle.smallBold.copyWith(
                    color: AppColor.green1_600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
