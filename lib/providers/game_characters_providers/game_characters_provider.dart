import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/services/db_services/game_characters_service.dart';

part 'game_characters_provider.g.dart';

@riverpod
class GameCharactersController extends _$GameCharactersController {
  late Database _database;

  late final GameCharacters _gameCharactersNotifier;

  @override
  FutureOr<void> build() async {
    _database = await ref.watch(databaseProvider.future);
    _gameCharactersNotifier = ref.read(gameCharactersProvider.notifier);
    final characters = await _database.getAllCharacters();
    _gameCharactersNotifier.add(characters);
    return;
  }

  Future<void> addCharacter(GameCharacter newCharacter) async {
    state = await AsyncValue.guard(() async {
      final createdCharacter = await _database.createCharacter(newCharacter);
      _gameCharactersNotifier.add([createdCharacter]);
      return;
    });
  }
}

@riverpod
class GameCharacters extends _$GameCharacters {
  @override
  List<GameCharacter> build() {
    return [];
  }

  void add(List<GameCharacter> characters) {
    state = [...state, ...characters];
  }

  void clean() {
    state = [];
  }

  void remove(int index) {
    state = List.of(state)..removeAt(index);
  }
}

@riverpod
class GameCharacterController extends _$GameCharacterController {
  late final CharacterDisciplinesController disciplinesController;

  @override
  FutureOr<GameCharacter?> build() async {
    disciplinesController =
        await ref.read(characterDisciplinesControllerProvider.notifier);
    return null;
  }

  Future<void> load(GameCharacter character) async {
    await future;
    await disciplinesController.fetch(character.id!);
  }
}
