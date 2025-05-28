import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper/get_it_setup.dart';
import 'package:fruit_hup/core/widgets/auth_custom_app_bar.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hup/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';
import 'package:fruit_hup/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String id = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: authCustomAppBar(context: context, title: S.of(context).Login),
        body: const LoginViewBodyBlocConsumer(),
      ),
    );
  }
}
