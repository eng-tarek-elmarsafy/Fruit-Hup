// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fruit_hup/generated/intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome To `
  String get hello {
    return Intl.message('Welcome To ', name: 'hello', desc: '', args: []);
  }

  /// `Fruit`
  String get Fruit {
    return Intl.message('Fruit', name: 'Fruit', desc: '', args: []);
  }

  /// `HUB`
  String get HUB {
    return Intl.message('HUB', name: 'HUB', desc: '', args: []);
  }

  /// `Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best deals and top quality.`
  String get onboardingSuptitil1 {
    return Intl.message(
      'Discover a unique shopping experience with FruitHUB. Explore our wide selection of premium fresh fruits and enjoy the best deals and top quality.',
      name: 'onboardingSuptitil1',
      desc: '',
      args: [],
    );
  }

  /// `We bring you the finest, carefully selected fruits. Check out the details, photos, and reviews to make sure you’re choosing the perfect fruit.`
  String get onboardingSuptitil2 {
    return Intl.message(
      'We bring you the finest, carefully selected fruits. Check out the details, photos, and reviews to make sure you’re choosing the perfect fruit.',
      name: 'onboardingSuptitil2',
      desc: '',
      args: [],
    );
  }

  /// `Search and shop`
  String get title2 {
    return Intl.message('Search and shop', name: 'title2', desc: '', args: []);
  }

  /// `Skip`
  String get Skip {
    return Intl.message('Skip', name: 'Skip', desc: '', args: []);
  }

  /// `Get Started`
  String get GetStarted {
    return Intl.message('Get Started', name: 'GetStarted', desc: '', args: []);
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Create Account`
  String get CreateAccount {
    return Intl.message(
      'Create Account',
      name: 'CreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get EmailAddress {
    return Intl.message(
      'Email Address',
      name: 'EmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `Don't have an account?`
  String get DontHaveAnaccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'DontHaveAnaccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get GoogleSignIn {
    return Intl.message(
      'Sign in with Google',
      name: 'GoogleSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Apple`
  String get AppleSignIn {
    return Intl.message(
      'Sign in with Apple',
      name: 'AppleSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Facebook`
  String get FacebookSignIn {
    return Intl.message(
      'Sign in with Facebook',
      name: 'FacebookSignIn',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get Or {
    return Intl.message('Or', name: 'Or', desc: '', args: []);
  }

  /// `Full Name`
  String get FullName {
    return Intl.message('Full Name', name: 'FullName', desc: '', args: []);
  }

  /// `Email`
  String get Email {
    return Intl.message('Email', name: 'Email', desc: '', args: []);
  }

  /// `By creating an account, you agree to`
  String get ByCreatingAccountYouAgreeTo {
    return Intl.message(
      'By creating an account, you agree to',
      name: 'ByCreatingAccountYouAgreeTo',
      desc: '',
      args: [],
    );
  }

  /// `Our Terms and Conditions`
  String get OurTermsAndConditions {
    return Intl.message(
      'Our Terms and Conditions',
      name: 'OurTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get CreateNewAccount {
    return Intl.message(
      'Create New Account',
      name: 'CreateNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get AlreadyHaveAnAccountOnly {
    return Intl.message(
      'Already have an account?',
      name: 'AlreadyHaveAnAccountOnly',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry, just enter your phone number and we will send a verification code.`
  String get DontWorry {
    return Intl.message(
      'Don\'t worry, just enter your phone number and we will send a verification code.',
      name: 'DontWorry',
      desc: '',
      args: [],
    );
  }

  /// `Verify Code`
  String get VerifyCode {
    return Intl.message('Verify Code', name: 'VerifyCode', desc: '', args: []);
  }

  /// `Enter the code we sent to the following email address\nMaxxx@email.com`
  String get EnterCodeSentToEmail {
    return Intl.message(
      'Enter the code we sent to the following email address\nMaxxx@email.com',
      name: 'EnterCodeSentToEmail',
      desc: '',
      args: [],
    );
  }

  /// `Check Code`
  String get CheckCode {
    return Intl.message('Check Code', name: 'CheckCode', desc: '', args: []);
  }

  /// `Resend Code`
  String get ResendCode {
    return Intl.message('Resend Code', name: 'ResendCode', desc: '', args: []);
  }

  /// `Password changed successfully`
  String get PasswordChangedSuccessfully {
    return Intl.message(
      'Password changed successfully',
      name: 'PasswordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create an Account`
  String get CreateAnAccount {
    return Intl.message(
      'Create an Account',
      name: 'CreateAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get errorEnterEmail {
    return Intl.message(
      'Please enter your email',
      name: 'errorEnterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address`
  String get errorInvalidEmail {
    return Intl.message(
      'Invalid email address',
      name: 'errorInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get errorEnterPassword {
    return Intl.message(
      'Please enter your password',
      name: 'errorEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get errorShortPassword {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'errorShortPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain uppercase, lowercase, number, and special character`
  String get errorWeakPassword {
    return Intl.message(
      'Password must contain uppercase, lowercase, number, and special character',
      name: 'errorWeakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get errorEnterName {
    return Intl.message(
      'Please enter your name',
      name: 'errorEnterName',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 2 characters`
  String get errorShortName {
    return Intl.message(
      'Name must be at least 2 characters',
      name: 'errorShortName',
      desc: '',
      args: [],
    );
  }

  /// `Name should not contain numbers or symbols`
  String get errorInvalidName {
    return Intl.message(
      'Name should not contain numbers or symbols',
      name: 'errorInvalidName',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again`
  String get SomethingWentWrong {
    return Intl.message(
      'Something went wrong, please try again',
      name: 'SomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning!..`
  String get GoodMorning {
    return Intl.message(
      'Good Morning!..',
      name: 'GoodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Search for.......`
  String get SearchFor {
    return Intl.message(
      'Search for.......',
      name: 'SearchFor',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
