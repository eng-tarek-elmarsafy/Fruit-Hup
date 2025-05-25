import 'package:flutter/material.dart';
import 'package:fruit_hup/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/generated/l10n.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 24),
            CustomTextFormField(
              hintText: S.of(context).Email,
              // suffixIcon: const Icon(Icons.remove_red_eye, color: Color(0xffC9CECF)),
            ),
          ],
        ),
      ),
    );
  }
}
