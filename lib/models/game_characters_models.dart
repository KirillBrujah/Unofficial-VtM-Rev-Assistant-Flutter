import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vtm_assistant/gen/assets.gen.dart';

part 'game_characters_models.g.dart';

part 'game_characters_models.freezed.dart';

@freezed
class GameCharacter with _$GameCharacter {
  const GameCharacter._();

  const factory GameCharacter({
    int? id,
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
  const Clan._();

  const factory Clan({
    @JsonKey(name: "clan_id") required int id,
    @JsonKey(name: "clan_name") required String name,
  }) = _Clan;

  factory Clan.fromJson(Map<String, dynamic> json) => _$ClanFromJson(json);

  AssetGenImage? get logo {
    final logoAssets = Assets.images.clanLogos;

    final logos = {
      1:	logoAssets.assamite,
      2: logoAssets.brujah,
      3: logoAssets.followersOfSet,
      4: logoAssets.gangrel,
      5	: logoAssets.giovanni,
      6	: logoAssets.lasombra,
      7	: logoAssets.malkavian,
      8	: logoAssets.nosferatu,
      9	: logoAssets.ravnos,
      10: logoAssets.toreador,
      11: logoAssets.tremere,
      12: logoAssets.tzimisce,
      13: logoAssets.ventrue,
    };

    return logos[id];
  }
}
