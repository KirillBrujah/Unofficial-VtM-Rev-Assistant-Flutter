import 'package:isar/isar.dart';

part 'game_character_models.g.dart';

@collection
class GameCharacter {
  Id id = Isar.autoIncrement;

  late final String name;
  late final int generation;
  late final String? description;

  final clan = IsarLink<Clan>();
  
  @Backlink(to: 'gameCharacter')
  final attributes = IsarLinks<CharacterAttribute>();
}

@collection
class Clan {
  Id id = Isar.autoIncrement;

  late final String name;
  late final String logoPath;
}


@collection
class Attribute {
  Id id = Isar.autoIncrement;

  late final String name;

  @Enumerated(EnumType.name)
  late final AttributeTypes type;
}

@collection
class CharacterAttribute {
  Id id = Isar.autoIncrement;

  final gameCharacter = IsarLink<GameCharacter>();

  final attribute = IsarLink<Attribute>();

  late final int level;
}

enum AttributeTypes {
  physical,
  social,
  mental,
}