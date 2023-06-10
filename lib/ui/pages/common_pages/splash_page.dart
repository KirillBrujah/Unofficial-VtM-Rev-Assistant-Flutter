import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/utils/app_router.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const _SplashBody();
}

class _SplashBody extends ConsumerWidget {
  const _SplashBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashPreloadProvider, (previous, next) {
      next.whenOrNull(data: (preloadComplete) {
        if (preloadComplete) {
          context.router.replace(const GameCharactersRoute());
        }
      });
    });
    // TODO: Rework Splash page view
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
