import 'package:isar/isar.dart';
import 'package:vtm_assistant/utils/enums.dart';

import 'character_models.dart';

part 'attribute_models.g.dart';

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
