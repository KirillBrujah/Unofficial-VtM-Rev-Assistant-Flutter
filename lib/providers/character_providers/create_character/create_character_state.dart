import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

part 'create_character_state.g.dart';

@riverpod
class CreateCharacterState extends _$CreateCharacterState {
  late final CreateCharacterController createController;

  @override
  CharacterData build() {
    createController = ref.read(createCharacterControllerProvider.notifier);
    return const CharacterData();
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  // TODO: Other setters

  void create() {
    if (!state.isReady) return;

    createController.createCharacter(state);
  }
}
