import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

part 'create_character_state.g.dart';

@riverpod
class CreateCharacterState extends _$CreateCharacterState {
  late final CreateCharacterController createController;

  @override
  CharacterModel build() {
    createController = ref.read(createCharacterControllerProvider.notifier);

    return const CharacterModel();
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setGeneration(int value) {
    state = state.copyWith(generation: value);
  }

  void setClan(Clan? clan) {
    state = state.copyWith(clan: clan);
  }

  void setDescription(String value) {
    state = state.copyWith(description: value.isNotEmpty ? value : null);
  }

  // TODO: Other setters

  void save() {
    if (!state.isReady) return;

    createController.createCharacter(state);
  }
}
