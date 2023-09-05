import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

part 'db_characters_controller_service.g.dart';

@riverpod
class DbCharactersController extends _$DbCharactersController
    implements CharactersControllerService {
  late final CharactersService dbService;

  late final NetworkCharacterControllerService networkService;

  @override
  FutureOr<CharactersControllerState> build() async {
    dbService =
        IsarCharactersService(await ref.watch(isarInstanceProvider.future));

    networkService = ref.watch(networkCharacterControllerServiceProvider.notifier);

    return const CharactersControllerState.initial();
  }

  @override
  Future<void> create(CharacterModel character) async {
    await future;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await dbService.create(character);

      await networkService.create(character);
      print("NETWORK ADDED");

      return CharactersControllerState.added(character);
    });
  }
}
