// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    GameCharactersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GameCharactersPage(),
      );
    },
    CreateCharacterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateCharacterPage(),
      );
    },
    EditCharacterRoute.name: (routeData) {
      final args = routeData.argsAs<EditCharacterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditCharacterPage(
          key: args.key,
          gameCharacter: args.gameCharacter,
        ),
      );
    },
    GameCharacterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<GameCharacterDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GameCharacterDetailsPage(
          key: args.key,
          gameCharacter: args.gameCharacter,
        ),
      );
    },
  };
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GameCharactersPage]
class GameCharactersRoute extends PageRouteInfo<void> {
  const GameCharactersRoute({List<PageRouteInfo>? children})
      : super(
          GameCharactersRoute.name,
          initialChildren: children,
        );

  static const String name = 'GameCharactersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateCharacterPage]
class CreateCharacterRoute extends PageRouteInfo<void> {
  const CreateCharacterRoute({List<PageRouteInfo>? children})
      : super(
          CreateCharacterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateCharacterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditCharacterPage]
class EditCharacterRoute extends PageRouteInfo<EditCharacterRouteArgs> {
  EditCharacterRoute({
    Key? key,
    required GameCharacter gameCharacter,
    List<PageRouteInfo>? children,
  }) : super(
          EditCharacterRoute.name,
          args: EditCharacterRouteArgs(
            key: key,
            gameCharacter: gameCharacter,
          ),
          initialChildren: children,
        );

  static const String name = 'EditCharacterRoute';

  static const PageInfo<EditCharacterRouteArgs> page =
      PageInfo<EditCharacterRouteArgs>(name);
}

class EditCharacterRouteArgs {
  const EditCharacterRouteArgs({
    this.key,
    required this.gameCharacter,
  });

  final Key? key;

  final GameCharacter gameCharacter;

  @override
  String toString() {
    return 'EditCharacterRouteArgs{key: $key, gameCharacter: $gameCharacter}';
  }
}

/// generated route for
/// [GameCharacterDetailsPage]
class GameCharacterDetailsRoute
    extends PageRouteInfo<GameCharacterDetailsRouteArgs> {
  GameCharacterDetailsRoute({
    Key? key,
    required GameCharacter gameCharacter,
    List<PageRouteInfo>? children,
  }) : super(
          GameCharacterDetailsRoute.name,
          args: GameCharacterDetailsRouteArgs(
            key: key,
            gameCharacter: gameCharacter,
          ),
          initialChildren: children,
        );

  static const String name = 'GameCharacterDetailsRoute';

  static const PageInfo<GameCharacterDetailsRouteArgs> page =
      PageInfo<GameCharacterDetailsRouteArgs>(name);
}

class GameCharacterDetailsRouteArgs {
  const GameCharacterDetailsRouteArgs({
    this.key,
    required this.gameCharacter,
  });

  final Key? key;

  final GameCharacter gameCharacter;

  @override
  String toString() {
    return 'GameCharacterDetailsRouteArgs{key: $key, gameCharacter: $gameCharacter}';
  }
}
