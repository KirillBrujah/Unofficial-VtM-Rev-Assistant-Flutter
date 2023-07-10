import 'package:isar/isar.dart';

part 'game_character_models.g.dart';

@collection
class GameCharacter {
  Id id = Isar.autoIncrement;

  late final String name;
  late final int generation;
  late final String? description;

  final clan = IsarLink<Clan>();
}

@collection
class Clan {
  Id id = Isar.autoIncrement;

  late final String name;
  late final String logoPath;
}