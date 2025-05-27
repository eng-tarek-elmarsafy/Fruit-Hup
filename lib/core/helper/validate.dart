String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل البريد الإلكتروني';
  }
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$');

  if (!emailRegex.hasMatch(value)) {
    return 'البريد الإلكتروني غير صالح';
  }

  return null; // valid
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'من فضلك أدخل كلمة المرور';
  }

  if (value.length < 8) {
    return 'كلمة المرور يجب أن تكون 8 حروف على الأقل';
  }

  final hasUppercase = value.contains(RegExp(r'[A-Z]'));
  final hasLowercase = value.contains(RegExp(r'[a-z]'));
  final hasDigit = value.contains(RegExp(r'[0-9]'));
  final hasSpecialChar = value.contains(RegExp(r'[!@#\$&*~]'));

  if (!hasUppercase || !hasLowercase || !hasDigit || !hasSpecialChar) {
    return 'يجب أن تحتوي كلمة المرور على حرف كبير، صغير، رقم، ورمز خاص';
  }

  return null; // valid
}

String? validateName(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'من فضلك ادخل الاسم';
  } else if (value.trim().length < 2) {
    return 'الاسم لازم يكون على الأقل حرفين';
  }
  return null;
}
