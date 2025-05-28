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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: ErrorWidgetView(
                message: state.message,
                title: 'حدث خطأ',
                onRetry: () {},
              ),
            ),
          );
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

class ErrorWidgetView extends StatelessWidget {
  const ErrorWidgetView({
    super.key,
    required this.title,
    required this.message,
    required this.onRetry,
  });
  final String title;
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.redAccent, size: 72),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            // const SizedBox(height: 24),
            // ElevatedButton(
            //   onPressed: onRetry,
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.redAccent,
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: 24,
            //       vertical: 12,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            //   child: const Text(
            //     'إعادة المحاولة',
            //     style: TextStyle(fontSize: 16),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
