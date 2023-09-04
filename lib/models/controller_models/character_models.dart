import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vtm_assistant/models/models.dart';

part 'character_models.freezed.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const CharacterModel._();

  const factory CharacterModel({
    @Default("") String name,
    @Default(13) int generation,
    String? description,
    Clan? clan,
    @Default([]) List<AttributeModel> attributes,
  }) = _CharacterData;

  bool get isReady => name.isNotEmpty && clan != null;
}
