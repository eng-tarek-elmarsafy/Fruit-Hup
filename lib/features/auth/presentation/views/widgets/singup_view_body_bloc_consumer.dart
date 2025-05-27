import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/features/auth/presentation/manager/singup_cubit/singup_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/singup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SingUpViewBodyBlocConsumer extends StatelessWidget {
  const SingUpViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingupCubit, SingupState>(
      listener: (context, state) {
        if (state is SingupFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SingupLoading ? true : false,
          child: const SingUpViewBody(),
        );
      },
    );
  }
}
