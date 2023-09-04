import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart';

part 'characters_controller_state.freezed.dart';

@freezed
class CharactersControllerState with _$CharactersControllerState {
  const factory CharactersControllerState.initial() = _initial;

  const factory CharactersControllerState.added(CharacterModel character) =
  _added;

  const factory CharactersControllerState.edited(
      int index, CharacterModel character) = _edited;

  const factory CharactersControllerState.removed() = _removed;
}