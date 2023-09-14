import 'package:isar/isar.dart';
import 'package:vtm_assistant/utils/enums.dart';

import 'character_models.dart';

part 'ability_models.g.dart';

@collection
class Ability {
  Id id = Isar.autoIncrement;

  late final String name;

  @Enumerated(EnumType.name)
  late final AbilityTypes type;
}

@collection
class CharacterAbility {
  Id id = Isar.autoIncrement;

  final character = IsarLink<Character>();

  final ability = IsarLink<Ability>();

  late final int value;
}
