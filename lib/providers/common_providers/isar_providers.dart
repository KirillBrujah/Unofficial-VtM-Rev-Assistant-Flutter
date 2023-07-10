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
        GameCharacterSchema,
        ClanSchema,
      ],
      directory: dir.path,
    );

    // TODO: Remove clear

    await isar.writeTxn(() async {
      await isar.clear();
    });

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

    print(isar.clans);

    return isar;
  }
}
