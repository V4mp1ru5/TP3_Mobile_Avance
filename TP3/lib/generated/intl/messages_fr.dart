// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

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
        "add": MessageLookupByLibrary.simpleMessage("Ajouter"),
        "addTask": MessageLookupByLibrary.simpleMessage("Ajouté une tâche"),
        "ajouterUneImage":
            MessageLookupByLibrary.simpleMessage("Ajouter une image"),
        "consultation": MessageLookupByLibrary.simpleMessage("Consultation"),
        "cration": MessageLookupByLibrary.simpleMessage("Création"),
        "deadline": MessageLookupByLibrary.simpleMessage("Échéance:"),
        "disconnect": MessageLookupByLibrary.simpleMessage("Déconnecter"),
        "error": MessageLookupByLibrary.simpleMessage("Erreur reseau"),
        "login": MessageLookupByLibrary.simpleMessage("Connexion"),
        "loginWithGoogle":
            MessageLookupByLibrary.simpleMessage("Connecter avec google"),
        "modifierLimage":
            MessageLookupByLibrary.simpleMessage("Modifier l\'image"),
        "pDone": MessageLookupByLibrary.simpleMessage("Pourcentage complété:"),
        "pageHomeConfirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "pageHomeWelcome": m0,
        "pageHomeWelcomeGender": m1,
        "pageHomeWelcomeRole": m2,
        "pageNotificationsCount": m3,
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "passwordConfirmation": MessageLookupByLibrary.simpleMessage(
            "Confirmation du mot de passe"),
        "register": MessageLookupByLibrary.simpleMessage("Enregistrer"),
        "slectionnerUneImage":
            MessageLookupByLibrary.simpleMessage("Sélectionner une image"),
        "tName": MessageLookupByLibrary.simpleMessage("Nom de la tâche:"),
        "tPassed":
            MessageLookupByLibrary.simpleMessage("Pourcentage de temps passé:"),
        "taskName": MessageLookupByLibrary.simpleMessage("Nom de la tâche"),
        "thisPasswordIsTooShort": MessageLookupByLibrary.simpleMessage(
            "Ce mot de passe est trop court"),
        "thisUsernameIsAlreadyTaken": MessageLookupByLibrary.simpleMessage(
            "Ce nom d\'utilisateur est déjà pris"),
        "thisUsernameIsTooShort": MessageLookupByLibrary.simpleMessage(
            "Ce nom d\'utilisateur est trop court"),
        "update": MessageLookupByLibrary.simpleMessage("Mettre à jour"),
        "username": MessageLookupByLibrary.simpleMessage("Nom d\'utilisateur"),
        "welcome": MessageLookupByLibrary.simpleMessage("Acceuil"),
        "yourPasswordAndConfirmationAreNotTheSame":
            MessageLookupByLibrary.simpleMessage(
                "Votre mot de passe et votre confirmation ne sont pas les mêmes")
      };
}
