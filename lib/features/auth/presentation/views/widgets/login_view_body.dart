import 'package:flutter/material.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/core/widgets/or_divider_row.dart';
import 'package:fruit_hup/features/auth/presentation/views/singup_view.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/forgot_password_text_button.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/sign_up_promp_row.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruit_hup/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: S.of(context).Email,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              textInputType: TextInputType.visiblePassword,
              hintText: S.of(context).Password,
              suffixIcon: const Icon(
                Icons.remove_red_eye,
                color: Color(0xffC9CECF),
              ),
            ),
            const SizedBox(height: 16),
            const ForgotPasswordTextButton(),
            const SizedBox(height: 33),
            CustomButton(title: S.of(context).Login, onPressed: () {}),
            const SizedBox(height: 33),
            SignUpPromptRow(
              text1: S.of(context).DontHaveAnaccount,
              text2: S.of(context).CreateAnAccount,
            ),
            const SizedBox(height: 33),
            const OrDividerRow(),
            const SizedBox(height: 16),
            SocialLoginButton(
              title: S.of(context).GoogleSignIn,
              logo: Assets.imageGooglLogo,
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              title: S.of(context).AppleSignIn,
              logo: Assets.imageAppleLogo,
            ),
            const SizedBox(height: 16),
            SocialLoginButton(
              title: S.of(context).FacebookSignIn,
              logo: Assets.imageFecbookLogo,
            ),
          ],
        ),
      ),
    );
  }
}
