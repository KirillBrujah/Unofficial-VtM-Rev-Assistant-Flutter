import 'package:sqflite/sqflite.dart';
import 'package:vtm_assistant/models/game_characters_models.dart';

const _gameCharacters = 'game_characters';
const _gameCharactersView = 'game_characters_view';

extension GameCharactersDatabaseExtension on Database {
  Future<List<GameCharacter>> getAllCharacters() async {
    List<Map<String, dynamic>> queries = await query(_gameCharactersView);

    return queries.map((dict) => GameCharacter.fromQuery(dict)).toList();
  }

  Future<GameCharacter> createCharacter(GameCharacter character) async {
    final id = await insert(_gameCharacters, {
      "name": character.name,
      "generation": character.generation,
      "description": character.description,
      "clan_id": character.clan.id,
    });

    return character.copyWith(id: id);
  }
}
