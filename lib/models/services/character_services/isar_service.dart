import 'package:isar/isar.dart';
import 'package:vtm_assistant/models/models.dart';

class IsarCharactersService implements CharactersService {
  final Isar isar;

  IsarCharactersService(this.isar);

  @override
  Future<void> create(CharacterModel character) async {
    await isar.writeTxn(() async {
      final newCharacter = Character()
        ..name = character.name
        ..generation = character.generation
        ..description = character.description
        ..createdOn = DateTime.now();

      await isar.characters.put(newCharacter);

      newCharacter.clan.value = character.clan;
      await newCharacter.clan.save();

      // return true;

      // final strength = await isar.attributes.get(1);
      //
      // final characterAttribute = CharacterAttribute()
      //   ..level = 6
      //   ..character.value = killian
      //   ..attribute.value = strength;
      //
      // final newAttribute = await (isar.characterAttributes
      //     .get(await isar.characterAttributes.put(characterAttribute)));

      // killian!.attributes.add(newAttribute!);

      // await newAttribute!.character.save();
      // await newAttribute.attribute.save();
      // await killian!.attributes.save();

      // final dexterity = await isar.attributes.get(2);

      // final characterAttribute2 = CharacterAttribute()
      //   ..level = 6
      //   ..attribute.value = dexterity;

      // final newAttribute2 = await (isar.characterAttributes
      //     .get(await isar.characterAttributes.put(characterAttribute2)));
    });
  }
}
