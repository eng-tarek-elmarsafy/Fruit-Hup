import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/utils/assets.dart';
import 'package:fruit_hup/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/social_login_button.dart';
import 'package:fruit_hup/generated/l10n.dart';

class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButton(
          title: S.of(context).GoogleSignIn,
          logo: Assets.imageGooglLogo,
          onPressed: () {
            context.read<LoginCubit>().signInWithGoogle();
          },
        ),
        const SizedBox(height: 16),
        SocialLoginButton(
          title: S.of(context).AppleSignIn,
          logo: Assets.imageAppleLogo,
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        SocialLoginButton(
          title: S.of(context).FacebookSignIn,
          logo: Assets.imageFecbookLogo,
          onPressed: () {
            context.read<LoginCubit>().signInWithFacebook();
          },
        ),
      ],
    );
  }
}
