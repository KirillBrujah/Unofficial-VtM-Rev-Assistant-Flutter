import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vtm_assistant/gen/assets.gen.dart';

part 'database_provider.g.dart';

const _databaseName = 'vtm_assistant.db';

@riverpod
Future<Database> database(DatabaseRef ref) async {
  final databasesPath = await getDatabasesPath();
  final path = '$databasesPath/$_databaseName';

  await deleteDatabase(path);

  final exists = await databaseExists(path);

  if (!exists) {
    ByteData data = await rootBundle.load(Assets.db.vtmAssistant);

    List<int> bytes =
    data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    await File(path).writeAsBytes(bytes, flush: true);
  }



  final db = await openDatabase(path);

  return db;
}
