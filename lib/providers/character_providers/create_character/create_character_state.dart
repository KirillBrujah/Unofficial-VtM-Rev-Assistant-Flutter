import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

part 'create_character_state.g.dart';

@riverpod
class CreateCharacterState extends _$CreateCharacterState {
  late List<AttributeModel> attributes;

  @override
  CharacterModel build() {
    ref.listen(
      characterAttributesControllerProvider
          .select((characterAttributes) => characterAttributes.value ?? []),
      (previous, next) {
        state = state.copyWith(attributes: next);
      },
    );

    // TODO: Skills listener
    // TODO: Disciplines listener

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

    ref.read(dbCharactersControllerProvider.notifier).create(state);
  }
}
