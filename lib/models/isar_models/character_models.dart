import 'package:isar/isar.dart';

import 'ability_models.dart';
import 'attribute_models.dart';

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

  @Backlink(to: 'character')
  final abilities = IsarLinks<CharacterAbility>();
}

@collection
class Clan {
  Id id = Isar.autoIncrement;

  late final String name;
  late final String logoPath;

  @override
  String toString() => name;
}
