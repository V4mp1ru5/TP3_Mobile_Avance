// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Confirm`
  String get pageHomeConfirm {
    return Intl.message(
      'Confirm',
      name: 'pageHomeConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Welcome {name}`
  String pageHomeWelcome(Object name) {
    return Intl.message(
      'Welcome $name',
      name: 'pageHomeWelcome',
      desc: '',
      args: [name],
    );
  }

  /// `{gender, select, male {Hi man!} female {Hi woman!} other {Hi there!}}`
  String pageHomeWelcomeGender(String gender) {
    return Intl.gender(
      gender,
      male: 'Hi man!',
      female: 'Hi woman!',
      other: 'Hi there!',
      name: 'pageHomeWelcomeGender',
      desc: '',
      args: [gender],
    );
  }

  /// `{role, select, admin {Hi admin!} manager {Hi manager!} other {Hi visitor!}}`
  String pageHomeWelcomeRole(Object role) {
    return Intl.select(
      role,
      {
        'admin': 'Hi admin!',
        'manager': 'Hi manager!',
        'other': 'Hi visitor!',
      },
      name: 'pageHomeWelcomeRole',
      desc: '',
      args: [role],
    );
  }

  /// `{howMany, plural, one{1 message} other{{howMany} messages}}`
  String pageNotificationsCount(num howMany) {
    return Intl.plural(
      howMany,
      one: '1 message',
      other: '$howMany messages',
      name: 'pageNotificationsCount',
      desc: '',
      args: [howMany],
    );
  }

  /// `Network error`
  String get error {
    return Intl.message(
      'Network error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Add task`
  String get addTask {
    return Intl.message(
      'Add task',
      name: 'addTask',
      desc: '',
      args: [],
    );
  }

  /// `Disconnect`
  String get disconnect {
    return Intl.message(
      'Disconnect',
      name: 'disconnect',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Consultation`
  String get consultation {
    return Intl.message(
      'Consultation',
      name: 'consultation',
      desc: '',
      args: [],
    );
  }

  /// `Select an image`
  String get slectionnerUneImage {
    return Intl.message(
      'Select an image',
      name: 'slectionnerUneImage',
      desc: '',
      args: [],
    );
  }

  /// `Add an image`
  String get ajouterUneImage {
    return Intl.message(
      'Add an image',
      name: 'ajouterUneImage',
      desc: '',
      args: [],
    );
  }

  /// `Modify the image`
  String get modifierLimage {
    return Intl.message(
      'Modify the image',
      name: 'modifierLimage',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get cration {
    return Intl.message(
      'Create',
      name: 'cration',
      desc: '',
      args: [],
    );
  }

  /// `Task Name`
  String get taskName {
    return Intl.message(
      'Task Name',
      name: 'taskName',
      desc: '',
      args: [],
    );
  }

  /// `Your password and confirmation are not the same.`
  String get yourPasswordAndConfirmationAreNotTheSame {
    return Intl.message(
      'Your password and confirmation are not the same.',
      name: 'yourPasswordAndConfirmationAreNotTheSame',
      desc: '',
      args: [],
    );
  }

  /// `This username is already taken`
  String get thisUsernameIsAlreadyTaken {
    return Intl.message(
      'This username is already taken',
      name: 'thisUsernameIsAlreadyTaken',
      desc: '',
      args: [],
    );
  }

  /// `This password is too short`
  String get thisPasswordIsTooShort {
    return Intl.message(
      'This password is too short',
      name: 'thisPasswordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `This username is too short`
  String get thisUsernameIsTooShort {
    return Intl.message(
      'This username is too short',
      name: 'thisUsernameIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation`
  String get passwordConfirmation {
    return Intl.message(
      'Password confirmation',
      name: 'passwordConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Task name:`
  String get tName {
    return Intl.message(
      'Task name:',
      name: 'tName',
      desc: '',
      args: [],
    );
  }

  /// `Percentage done:`
  String get pDone {
    return Intl.message(
      'Percentage done:',
      name: 'pDone',
      desc: '',
      args: [],
    );
  }

  /// `Time paste percentage:`
  String get tPassed {
    return Intl.message(
      'Time paste percentage:',
      name: 'tPassed',
      desc: '',
      args: [],
    );
  }

  /// `Deadline:`
  String get deadline {
    return Intl.message(
      'Deadline:',
      name: 'deadline',
      desc: '',
      args: [],
    );
  }

  /// `Login with google`
  String get loginWithGoogle {
    return Intl.message(
      'Login with google',
      name: 'loginWithGoogle',
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
      Locale.fromSubtags(languageCode: 'fr'),
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
