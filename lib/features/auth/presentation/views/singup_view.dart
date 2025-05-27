import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper/get_it_setup.dart';
import 'package:fruit_hup/core/widgets/auth_custom_app_bar.dart';
import 'package:fruit_hup/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hup/features/auth/presentation/manager/singup_cubit/singup_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/singup_view_body.dart';
import 'package:fruit_hup/generated/l10n.dart';

class SingUpView extends StatelessWidget {
  const SingUpView({super.key});
  static const String id = 'singup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingupCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: authCustomAppBar(
          context: context,
          title: S.of(context).CreateAccount,
        ),
        body: const SingUpViewBody(),
      ),
    );
  }
}
