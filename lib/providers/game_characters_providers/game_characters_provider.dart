import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/services/db_services/game_characters_service.dart';

part 'game_characters_provider.g.dart';

// final gameCharactersProvider = StateProvider<List<GameCharacter>>((ref) => []);

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

/*
@riverpod
class GameCharacters extends _$GameCharacters {
  late Database database;

  @override
  FutureOr<List<GameCharacter>> build() async {
*/
/*    ref.listen(databaseProvider, (previous, next) {
      next.whenOrNull(
        data: (database) async {
          this.database = database;
          state = await AsyncValue.guard(database.getAllCharacters);
        },
        loading: () => state = const AsyncLoading(),
      );
    });*/ /*


    database = await ref.watch(databaseProvider.future);

    return database.getAllCharacters();
  }

  Future<void> createCharacter(GameCharacter character) async {
    state = await AsyncValue.guard(() async {
      final newCharacter = await database.createCharacter(character);
      return database.getAllCharacters();
    });
  }
}
*/
