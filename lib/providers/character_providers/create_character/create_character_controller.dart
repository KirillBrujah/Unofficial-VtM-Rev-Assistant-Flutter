import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

part 'create_character_controller.g.dart';

@riverpod
class CreateCharacterController extends _$CreateCharacterController {
  late final CharacterServiceController dbService;

  @override
  FutureOr<bool> build() async {
    dbService = IsarCharacterServiceController(
        await ref.watch(isarInstanceProvider.future));

    return false;
  }

  Future<void> createCharacter(
    CharacterModel characterData, {
    required List<AttributeModel> attributes,
  }) async {
    await future;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await dbService.create(characterData);

      return true;
    });
  }
}
