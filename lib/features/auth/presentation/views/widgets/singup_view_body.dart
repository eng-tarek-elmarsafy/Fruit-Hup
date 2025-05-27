import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hup/core/helper/validate.dart';
import 'package:fruit_hup/core/widgets/custom_button.dart';
import 'package:fruit_hup/core/widgets/custom_text_form_field.dart';
import 'package:fruit_hup/features/auth/presentation/manager/singup_cubit/singup_cubit.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/sign_up_promp_row.dart';
import 'package:fruit_hup/features/auth/presentation/views/widgets/terms_and_conditions_agreement_row.dart';
import 'package:fruit_hup/generated/l10n.dart';

class SingUpViewBody extends StatefulWidget {
  const SingUpViewBody({super.key});

  @override
  State<SingUpViewBody> createState() => _SingUpViewBodyState();
}

class _SingUpViewBodyState extends State<SingUpViewBody> {
  late GlobalKey<FormState> formKey;
  late AutovalidateMode autovalidateMode;
  bool obscureText = true;
  bool isReadTermsAndConditions = false;
  late String name, email, password;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
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
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                validator: validateName,
                onSaved: (p0) {
                  name = p0!;
                },
                hintText: S.of(context).FullName,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (p0) {
                  email = p0!;
                },
                validator: validateEmail,
                textInputType: TextInputType.emailAddress,
                hintText: S.of(context).Email,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                onSaved: (p0) {
                  password = p0!;
                },
                obscureText: obscureText,
                validator: validatePassword,
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
              TermsAndConditionsAgreementRow(
                onChacked: (bool isChacked) {
                  isReadTermsAndConditions = isChacked;
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                title: S.of(context).CreateNewAccount,
                onPressed: () {
                  _submitSignupForm(context);
                },
              ),
              const SizedBox(height: 30),
              SignUpPromptRow(
                text1: S.of(context).AlreadyHaveAnAccountOnly,
                text2: S.of(context).Login,
                goTo: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitSignupForm(BuildContext context) {
    if (formKey.currentState!.validate() && isReadTermsAndConditions) {
      formKey.currentState!.save();
      context.read<SingupCubit>().createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }
}
