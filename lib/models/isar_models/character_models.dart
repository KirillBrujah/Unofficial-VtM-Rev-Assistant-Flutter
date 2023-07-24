import 'package:isar/isar.dart';
import 'package:vtm_assistant/utils/enums.dart';

part 'character_models.g.dart';

@collection
class Character {
  Id id = Isar.autoIncrement;

  late final String name;
  late final int generation;
  late final String? description;
  late final DateTime createdOn;

  final clan = IsarLink<Clan>();

  @Backlink(to: 'character')
  final attributes = IsarLinks<CharacterAttribute>();
}

@collection
class Clan {
  Id id = Isar.autoIncrement;

  late final String name;
  late final String logoPath;

  @override
  String toString() => name;
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

  final character = IsarLink<Character>();

  final attribute = IsarLink<Attribute>();

  late final int value;
}
