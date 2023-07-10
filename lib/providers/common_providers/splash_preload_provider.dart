import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_preload_provider.g.dart';

@riverpod
Future<bool> splashPreload(SplashPreloadRef ref) async {
  // await ref.watch(isarControllerProvider.future);

  return true;
}