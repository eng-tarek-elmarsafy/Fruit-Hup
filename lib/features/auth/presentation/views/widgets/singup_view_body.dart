import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/app_color.dart';
import 'package:fruit_hup/core/utils/app_style.dart';
import 'package:fruit_hup/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/custom_chack_box.dart';
import 'package:fruit_hup/generated/l10n.dart';

class SingUpViewBody extends StatelessWidget {
  const SingUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(hintText: S.of(context).FullName),
            const SizedBox(height: 16),
            CustomTextFormField(hintText: S.of(context).Email),
            const SizedBox(height: 16),
            CustomTextFormField(
              hintText: S.of(context).Password,
              suffixIcon: const Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const CustomChackBox(),
                const SizedBox(width: 16),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: S.of(context).ByCreatingAccountYouAgreeTo,
                          style: AppStyle.smallBold.copyWith(
                            color: AppColor.gray400,
                          ),
                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
