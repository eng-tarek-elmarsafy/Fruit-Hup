// String? validateEmail(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'من فضلك أدخل البريد الإلكتروني';
//   }
//   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');

//   if (!emailRegex.hasMatch(value)) {
//     return 'البريد الإلكتروني غير صالح';
//   }

//   return null; // valid
// }

// String? validatePassword(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'من فضلك أدخل كلمة المرور';
//   }

//   if (value.length < 8) {
//     return 'كلمة المرور يجب أن تكون 8 حروف على الأقل';
//   }

//   final hasUppercase = value.contains(RegExp(r'[A-Z]'));
//   final hasLowercase = value.contains(RegExp(r'[a-z]'));
//   final hasDigit = value.contains(RegExp(r'[0-9]'));
//   final hasSpecialChar = value.contains(RegExp(r'[!@#\$&*~]'));

//   if (!hasUppercase || !hasLowercase || !hasDigit || !hasSpecialChar) {
//     return 'يجب أن تحتوي كلمة المرور على حرف كبير، صغير، رقم، ورمز خاص';
//   }

//   return null; // valid
// }

// String? validateName(String? value) {
//   if (value == null || value.trim().isEmpty) {
//     return 'من فضلك ادخل الاسم';
//   } else if (value.trim().length < 2) {
//     return 'الاسم لازم يكون على الأقل حرفين';
//   }
//   return null;
// }
import 'package:flutter/material.dart';
import 'package:fruit_hup/generated/l10n.dart';

String? validateEmail(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).errorEnterEmail;
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');
  if (!emailRegex.hasMatch(value)) {
    return S.of(context).errorInvalidEmail;
  }

  return null;
}

String? validatePassword(String? value, BuildContext context) {
  if (value == null || value.isEmpty) {
    return S.of(context).errorEnterPassword;
  }

  if (value.length < 8) {
    return S.of(context).errorShortPassword;
  }

  final hasUppercase = value.contains(RegExp(r'[A-Z]'));
  final hasLowercase = value.contains(RegExp(r'[a-z]'));
  final hasDigit = value.contains(RegExp(r'[0-9]'));
  final hasSpecialChar = value.contains(RegExp(r'[!@#\$&*~]'));

  if (!hasUppercase || !hasLowercase || !hasDigit || !hasSpecialChar) {
    return S.of(context).errorWeakPassword;
  }

  return null;
}

String? validateName(String? value, BuildContext context) {
  if (value == null || value.trim().isEmpty) {
    return S.of(context).errorEnterName;
  } else if (value.trim().length < 2) {
    return S.of(context).errorShortName;
  }

  final nameRegex = RegExp(r'^[\p{L} ]+$', unicode: true);
  if (!nameRegex.hasMatch(value.trim())) {
    return S.of(context).errorInvalidName;
  }

  return null;
}
