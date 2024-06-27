// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Welcome ${name}";

  static String m1(gender) =>
      "${Intl.gender(gender, female: 'Hi woman!', male: 'Hi man!', other: 'Hi there!')}";

  static String m2(role) => "${Intl.select(role, {
            'admin': 'Hi admin!',
            'manager': 'Hi manager!',
            'other': 'Hi visitor!',
          })}";

  static String m3(howMany) =>
      "${Intl.plural(howMany, one: '1 message', other: '${howMany} messages')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addTask": MessageLookupByLibrary.simpleMessage("Add task"),
        "ajouterUneImage": MessageLookupByLibrary.simpleMessage("Add an image"),
        "consultation": MessageLookupByLibrary.simpleMessage("Consultation"),
        "cration": MessageLookupByLibrary.simpleMessage("Create"),
        "deadline": MessageLookupByLibrary.simpleMessage("Deadline:"),
        "disconnect": MessageLookupByLibrary.simpleMessage("Disconnect"),
        "error": MessageLookupByLibrary.simpleMessage("Network error"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Login with google"),
        "modifierLimage":
            MessageLookupByLibrary.simpleMessage("Modify the image"),
        "pDone": MessageLookupByLibrary.simpleMessage("Percentage done:"),
        "pageHomeConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "pageHomeWelcome": m0,
        "pageHomeWelcomeGender": m1,
        "pageHomeWelcomeRole": m2,
        "pageNotificationsCount": m3,
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "passwordConfirmation":
            MessageLookupByLibrary.simpleMessage("Password confirmation"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "slectionnerUneImage":
            MessageLookupByLibrary.simpleMessage("Select an image"),
        "tName": MessageLookupByLibrary.simpleMessage("Task name:"),
        "tPassed":
            MessageLookupByLibrary.simpleMessage("Time paste percentage:"),
        "taskName": MessageLookupByLibrary.simpleMessage("Task Name"),
        "thisPasswordIsTooShort":
            MessageLookupByLibrary.simpleMessage("This password is too short"),
        "thisUsernameIsAlreadyTaken": MessageLookupByLibrary.simpleMessage(
            "This username is already taken"),
        "thisUsernameIsTooShort":
            MessageLookupByLibrary.simpleMessage("This username is too short"),
        "update": MessageLookupByLibrary.simpleMessage("Update"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "welcome": MessageLookupByLibrary.simpleMessage("Welcome"),
        "yourPasswordAndConfirmationAreNotTheSame":
            MessageLookupByLibrary.simpleMessage(
                "Your password and confirmation are not the same.")
      };
}
