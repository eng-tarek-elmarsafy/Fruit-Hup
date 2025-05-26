import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/sign_up_promp_row.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/terms_and_conditions_agreement_row.dart';
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
            const TermsAndConditionsAgreementRow(),
            const SizedBox(height: 30),
            CustomButton(
              title: S.of(context).CreateNewAccount,
              onPressed: () {},
            ),
            const SizedBox(height: 30),
            SignUpPromptRow(
              text1: S.of(context).AlreadyHaveAnAccountOnly,
              text2: S.of(context).Login,
              goTo: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
