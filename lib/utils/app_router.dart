import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/ui/pages/pages.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: GameCharactersRoute.page),
        AutoRoute(page: CreateCharacterRoute.page),
        AutoRoute(page: GameCharacterDetailsRoute.page),
        AutoRoute(page: EditCharacterRoute.page),
      ];
}
