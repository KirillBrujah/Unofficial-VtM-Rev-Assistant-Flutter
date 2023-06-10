import 'package:sqflite/sqflite.dart';
import 'package:vtm_assistant/models/game_characters_models.dart';

const _gameCharacters = 'game_characters';
const _gameCharactersView = 'game_characters_view';

extension GameCharactersDatabaseExtension on Database {
  Future<List<GameCharacter>> getAllCharacters() async {
    List<Map<String, dynamic>> list = await query(_gameCharactersView);

    return list.map((dict) => GameCharacter.fromQuery(dict)).toList();
  }
}
