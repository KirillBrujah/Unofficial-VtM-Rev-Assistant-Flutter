import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

part 'create_character_controller.g.dart';

@riverpod
class CreateCharacterController extends _$CreateCharacterController {
  late final Isar isar;

  @override
  FutureOr<bool> build() async {
    isar = await ref.watch(isarControllerProvider.future);
    return false;
  }

  Future<void> createCharacter(CharacterData characterData) async {
    await future;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await isar.writeTxn(() async {
        final newCharacter = Character()
          ..name = characterData.name
          ..generation = characterData.generation
          ..description = characterData.description
          ..createdOn = DateTime.now();

        await isar.characters.put(newCharacter);

        final brujah = await isar.clans.get(2);
        newCharacter.clan
          ..value = brujah
          ..save();

        return true;

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
    });
  }
}
