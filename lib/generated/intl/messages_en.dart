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

  static String m0(name) => "Character ${name} created";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "abilities": MessageLookupByLibrary.simpleMessage("Abilities"),
        "attributes": MessageLookupByLibrary.simpleMessage("Attributes"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "character_was_created": m0,
        "characters": MessageLookupByLibrary.simpleMessage("Characters"),
        "choose_clan": MessageLookupByLibrary.simpleMessage("Choose Clan"),
        "clan": MessageLookupByLibrary.simpleMessage("Clan"),
        "create_character":
            MessageLookupByLibrary.simpleMessage("Create character"),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "disciplines": MessageLookupByLibrary.simpleMessage("Disciplines"),
        "edit": MessageLookupByLibrary.simpleMessage("Edit"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "generation": MessageLookupByLibrary.simpleMessage("Generation"),
        "knowledges": MessageLookupByLibrary.simpleMessage("Knowledges"),
        "mental": MessageLookupByLibrary.simpleMessage("Mental"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "other": MessageLookupByLibrary.simpleMessage("Other"),
        "physical": MessageLookupByLibrary.simpleMessage("Physical"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "skills": MessageLookupByLibrary.simpleMessage("Talents"),
        "social": MessageLookupByLibrary.simpleMessage("Social"),
        "talents": MessageLookupByLibrary.simpleMessage("Talents"),
        "title_placeholder":
            MessageLookupByLibrary.simpleMessage("VtM rev. Assistant")
      };
}
