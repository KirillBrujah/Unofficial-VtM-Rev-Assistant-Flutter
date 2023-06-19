import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/services/db_services/disciplines_service.dart';


part 'character_disciplines_controller_provider.g.dart';

@riverpod
class CharacterDisciplinesController extends _$CharacterDisciplinesController {
  late Database _database;


  late final CharacterDisciplines _characterDisciplinesNotifier;

  @override
  FutureOr<void> build() async {
    _database = await ref.watch(databaseProvider.future);

    _characterDisciplinesNotifier = ref.read(characterDisciplinesProvider.notifier);

    final disciplines = await _database.getCharacterDisciplines(gameCharacterId: 1);

    _characterDisciplinesNotifier.add(disciplines);

    return;
  }
}
