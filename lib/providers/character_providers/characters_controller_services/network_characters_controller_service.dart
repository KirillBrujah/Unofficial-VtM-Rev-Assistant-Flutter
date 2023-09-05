import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';

part 'network_characters_controller_service.g.dart';

@riverpod
class NetworkCharacterControllerService
    extends _$NetworkCharacterControllerService
    implements CharactersControllerService {
  late final CharactersService networkService;

  @override
  FutureOr<CharactersControllerState> build() async {
    networkService = NetworkCharactersService();

    // TODO: Watch user provider for checking auth state

    return const CharactersControllerState.initial();
  }

  @override
  Future<void> create(CharacterModel character) async {
    await future;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await networkService.create(character);
      return CharactersControllerState.added(character);
    });
  }
}
