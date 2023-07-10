import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vtm_assistant/models/models.dart';

import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/services/db_services/disciplines_service.dart';

// part 'character_disciplines_providers.g.dart';

//
// @riverpod
// class CharacterDisciplines extends _$CharacterDisciplines {
//   @override
//   // TODO: Replace with disciplines model
//   List<CharacterDiscipline> build() {
//     return [];
//   }
//
//   void add(List<CharacterDiscipline> disciplines) {
//     print("add $disciplines");
//     print(state);
//     state = List.of(disciplines);
//     print(state);
//     // state = disciplines;
//     // state = [...state, ...disciplines];
//   }
//
//   void clear() {
//     state = [];
//   }
// }
//
// @riverpod
// class CharacterDisciplinesController extends _$CharacterDisciplinesController {
//   late Database _database;
//
//   late final CharacterDisciplines _characterDisciplinesNotifier;
//
//   @override
//   FutureOr<void> build() async {
//     _database = await ref.watch(databaseProvider.future);
//     _characterDisciplinesNotifier =
//         ref.watch(characterDisciplinesProvider.notifier);
//     return;
//   }
//
//
//
//   Future<void> fetch(int characterId) async {
//     await future;
//     final disciplines = await _database.getCharacterDisciplines(
//       gameCharacterId: characterId,
//     );
//     ref.read(characterDisciplinesProvider.notifier).add(disciplines);
//     // _characterDisciplinesNotifier.add(disciplines);
//
//   }
//
//   Future<void> clear() async {
//     _characterDisciplinesNotifier.clear();
//   }
// }
//
