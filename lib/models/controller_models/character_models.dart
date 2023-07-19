import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_models.freezed.dart';

@freezed
class CharacterData with _$CharacterData {
  const CharacterData._();

  const factory CharacterData({
    @Default("") String name,
    @Default(13) int generation,
    String? description,
  }) = _CharacterData;

  bool get isReady => name.isNotEmpty;
}
