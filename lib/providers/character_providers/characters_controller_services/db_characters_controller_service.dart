import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/common_providers/isar_providers.dart';
import 'package:vtm_assistant/providers/providers.dart';

part 'db_characters_controller_service.g.dart';

@riverpod
class DbCharactersController extends _$DbCharactersController
    implements CharactersControllerService {
  late final CharactersService dbService;

  @override
  FutureOr<CharactersControllerState> build() async {
    dbService =
        IsarCharactersService(await ref.watch(isarInstanceProvider.future));

    return const CharactersControllerState.initial();
  }

  @override
  Future<void> create(CharacterModel character) async {
    await future;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await dbService.create(character);

      await ref.read(networkCharacterControllerServiceProvider.notifier).create(character);

      return CharactersControllerState.added(character);
    });
  }
}
