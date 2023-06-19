import 'package:sqflite/sqflite.dart';
import 'package:vtm_assistant/models/models.dart';

const _characterDisciplinesView = "game_characters_disciplines_view";

extension DisciplinesDatabaseExtension on Database {
  Future<List<CharacterDiscipline>> getCharacterDisciplines({
    required int gameCharacterId,
  }) async {
    List<Map<String, dynamic>> queries = await query(_characterDisciplinesView);

    return queries.map((dict) => CharacterDiscipline.fromQuery(dict)).toList();
  }
}
