import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'database_provider.dart';

part 'splash_preload_provider.g.dart';

@riverpod
Future<bool> splashPreload(SplashPreloadRef ref) async {
  await ref.watch(databaseProvider.future);

  return true;
}