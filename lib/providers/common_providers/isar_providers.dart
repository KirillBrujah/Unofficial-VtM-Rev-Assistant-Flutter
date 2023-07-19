import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/gen/assets.gen.dart';
import 'package:vtm_assistant/models/isar_models/models.dart';

part 'isar_providers.g.dart';

extension _RootX on AssetBundle {
  Future<List<Map<String, dynamic>>> getJsonList(String path) async =>
      (jsonDecode(await rootBundle.loadString(path)) as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList();
}

@riverpod
class IsarController extends _$IsarController {
  @override
  FutureOr<Isar> build() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [
        AttributeSchema,
        ClanSchema,
        GameCharacterSchema,
        CharacterAttributeSchema,
      ],
      directory: dir.path,
    );

    // TODO: Remove clear
    await isar.writeTxn(() async {
      await isar.clear();
    });

    if (await isar.attributes.count() == 0) {
      final attributesJson = await rootBundle.getJsonList(Assets.db.attributes);

      await isar.writeTxn(() async {
        isar.attributes.importJson(attributesJson);
      });
    }

    if (await isar.clans.count() == 0) {
      final clansJson = await rootBundle.getJsonList(Assets.db.clans);

      await isar.writeTxn(() async {
        isar.clans.importJson(clansJson);
      });
    }

    /*if (await isar.disciplines.count() == 0) {
      // TODO: Disciplines
      isar.writeTxn(() async {
        // TODO: Disciplines
      });
    }*/

    await isar.writeTxn(() async {
      await isar.gameCharacters.importJson(
        [
          {
            "id": 1,
            "name": "Killian",
            "clan": {
              "id": 2,
              "name": "Brujah",
              "logoPath": "assets/images/clan_logos/brujah.webp"
            },
            "generation": 4,
            "attributes": [],
          },
        ],
      );

      final killian = await isar.gameCharacters.get(1);
      final strength = await isar.attributes.get(1);

      final characterAttribute = CharacterAttribute()
        ..level = 6
        ..gameCharacter.value = killian
        ..attribute.value = strength;

      final newAttribute = await (isar.characterAttributes
          .get(await isar.characterAttributes.put(characterAttribute)));

      killian!.attributes.add(newAttribute!);

      await newAttribute!.gameCharacter.save();
      await newAttribute.attribute.save();
      await killian!.attributes.save();

      final dexterity = await isar.attributes.get(2);

      final characterAttribute2 = CharacterAttribute()
        ..level = 6
        ..attribute.value = dexterity;

      final newAttribute2 = await (isar.characterAttributes
          .get(await isar.characterAttributes.put(characterAttribute2)));
    });

    print("After creation");
    print(
        (await isar.gameCharacters.where().findAll()).first.attributes.length);
    print((await isar.characterAttributes.where().findAll()));

    await isar.writeTxn(() async {
      final killian = (await isar.gameCharacters.get(1))!;
      // killian.attributes.clear();
      // await killian.attributes.save();

      final deleted = await isar.characterAttributes
          .filter()
          .gameCharacter((character) => character.idEqualTo(killian.id))
          .deleteAll();

      print(deleted);

      await isar.gameCharacters.delete(killian.id);
    });

    print('After character delete');
    print((await isar.characterAttributes.where().findAll()));

    return isar;
  }
}
