import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widgets/error_widget_view.dart';
import 'package:fruit_hup/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:fruit_hup/features/main/presentation/views/main_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: ErrorWidgetView(
                message: state.message,
                title: 'حدث خطأ',
                onRetry: () {},
              ),
            ),
          );
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, MainView.id);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
