import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_characters_models.g.dart';

part 'game_characters_models.freezed.dart';

@freezed
class GameCharacter with _$GameCharacter {
  const factory GameCharacter({
    required int id,
    required String name,
    required int generation,
    String? description,
    required Clan clan,
  }) = _GameCharacter;

  factory GameCharacter.fromJson(Map<String, dynamic> json) =>
      _$GameCharacterFromJson(json);

  factory GameCharacter.fromQuery(Map<String, dynamic> query) {
    // return GameCharacter.fromJson(query);
    return GameCharacter.fromJson(Map.of(query)..["clan"]=query);
    return GameCharacter(
      id: query["id"],
      name: query["name"],
      generation: query["generation"],
      clan: Clan.fromJson(query),
    );
  }
}

@freezed
class Clan with _$Clan {
  const factory Clan({
    @JsonKey(name: "clan_id") required int id,
    @JsonKey(name: "clan_name") required String name,
  }) = _Clan;

  factory Clan.fromJson(Map<String, dynamic> json) => _$ClanFromJson(json);
}
