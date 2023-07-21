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
        AutoRoute(page: CharactersRoute.page),
        AutoRoute(page: CreateCharacterRoute.page, children: [
          AutoRoute(page: CharacterGeneralRoute.page, initial: true),
          AutoRoute(page: CharacterAttributesRoute.page),
          AutoRoute(page: CharacterSkillsRoute.page),
          AutoRoute(page: CharacterDisciplinesRoute.page),
          AutoRoute(page: CharacterOtherRoute.page),
        ]),
        AutoRoute(page: CharacterDetailsRoute.page),
        AutoRoute(page: EditCharacterRoute.page),
      ];
}
