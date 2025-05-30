import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/core/widgets/or_divider_row.dart';
import 'package:fruit_hup/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/singup_view.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/forgot_password_text_button.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/sign_up_promp_row.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/social_login.dart';
import 'package:fruit_hup/generated/l10n.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
  late String email, password;
  bool obscureText = true;

  @override
  void initState() {
    formKey = GlobalKey();
    autovalidateMode = AutovalidateMode.disabled;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك أدخل البريد الإلكتروني';
                  }
                  return null;
                },
                hintText: S.of(context).Email,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (value) {
                  password = value!;
                },
                obscureText: obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك أدخل كلمة المرور';
                  }
                  return null;
                },
                textInputType: TextInputType.visiblePassword,
                hintText: S.of(context).Password,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon:
                      obscureText
                          ? const Icon(
                            Icons.visibility_off,
                            color: Color(0xffC9CECF),
                          )
                          : const Icon(
                            Icons.remove_red_eye,
                            color: Color(0xffC9CECF),
                          ),
                ),
              ),
              const SizedBox(height: 16),
              const ForgotPasswordTextButton(),
              const SizedBox(height: 33),
              CustomButton(
                title: S.of(context).Login,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context.read<LoginCubit>().signInWithEmailAndPassword(
                      email,
                      password,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              const SizedBox(height: 33),
              SignUpPromptRow(
                text1: S.of(context).DontHaveAnaccount,
                text2: S.of(context).CreateAnAccount,
                goTo: () {
                  Navigator.pushNamed(context, SingUpView.id);
                },
              ),
              const SizedBox(height: 33),
              const OrDividerRow(),
              const SizedBox(height: 16),
              const SocialLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
