import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';

part 'character_disciplines_provider.g.dart';

@riverpod
class CharacterDisciplines extends _$CharacterDisciplines {
  @override
  // TODO: Replace with disciplines model
  List<CharacterDiscipline> build() {
    return [];
  }

  void add(List<CharacterDiscipline> disciplines) {
    state = [...state, ...disciplines];
  }
}
