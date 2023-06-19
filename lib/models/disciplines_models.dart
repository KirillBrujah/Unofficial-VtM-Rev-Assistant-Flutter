import 'package:freezed_annotation/freezed_annotation.dart';

part 'disciplines_models.g.dart';

part 'disciplines_models.freezed.dart';

@freezed
class Discipline with _$Discipline {
  const factory Discipline({
    required int id,
    required String name,
    String? description,
  }) = _Discipline;

  factory Discipline.fromJson(Map<String, dynamic> json) =>
      _$DisciplineFromJson(json);
}

@freezed
class CharacterDiscipline with _$CharacterDiscipline {
  const factory CharacterDiscipline({
    @JsonKey(name: "game_character_id") required int characterId,
    // @JsonKey(name: "discipline_name") required String disciplineName,
    @JsonKey(name: "discipline_level") required int level,
    required Discipline discipline,
  }) = _CharacterDiscipline;

  factory CharacterDiscipline.fromJson(Map<String, dynamic> json) =>
      _$CharacterDisciplineFromJson(json);

  factory CharacterDiscipline.fromQuery(Map<String, dynamic> query) {
    return CharacterDiscipline(
      characterId: query['game_character_id'] as int,
      level: query['discipline_level'] as int,
      discipline: Discipline(
        id: query["discipline_id"] as int,
        name: query["discipline_name"] as String,
        description: query['discipline_description'] as String?,
      ),
    );
  }
}
