import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

part 'character_streams.g.dart';

@riverpod
Stream<List<Character>> characters(CharactersRef ref) async* {
  final isar = await ref.watch(isarInstanceProvider.future);
  yield (await isar.characters.where().findAll());
  yield* isar.characters.where().watch();
}

@riverpod
Stream<List<Clan>> clans(ClansRef ref) async* {
  final isar = await ref.watch(isarInstanceProvider.future);
  yield (await isar.clans.where().findAll());
  yield* isar.clans.where().watch();
}

@riverpod
Stream<List<Ability>> abilities(AbilitiesRef ref) async* {
  final isar = await ref.watch(isarInstanceProvider.future);
  yield (await isar.abilitys.where().findAll());
  yield* isar.abilitys.where().watch();
}