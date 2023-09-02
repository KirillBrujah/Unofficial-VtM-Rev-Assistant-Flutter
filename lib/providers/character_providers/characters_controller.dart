import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/common_providers/isar_providers.dart';

part 'characters_controller.freezed.dart';

part 'characters_controller.g.dart';

@freezed
class CharactersControllerState with _$CharactersControllerState {
  const factory CharactersControllerState.initial() = _initial;

  const factory CharactersControllerState.added(CharacterModel character) =
      _added;

  const factory CharactersControllerState.edited(
      int index, CharacterModel character) = _edited;

  const factory CharactersControllerState.removed() = _removed;
}

@riverpod
class CharactersController extends _$CharactersController {
  late final CharacterServiceController dbService;

  @override
  FutureOr<CharactersControllerState> build() async {
    dbService = IsarCharacterServiceController(
        await ref.watch(isarInstanceProvider.future));



    return const CharactersControllerState.initial();
  }

  Future<void> createCharacter(
    CharacterModel characterData, {
    required List<AttributeModel> attributes,
  }) async {
    await future;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await dbService.create(characterData);

      return CharactersControllerState.added(characterData);
    });
  }
}
