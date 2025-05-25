import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widgets/auth_custom_app_bar.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruit_hup/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: authCustomAppBar(context: context, title: S.of(context).Login),
      body: const LoginViewBody(),
    );
  }
}
