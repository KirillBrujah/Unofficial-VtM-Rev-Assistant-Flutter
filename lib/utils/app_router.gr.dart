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
    EditCharacterRoute.name: (routeData) {
      final args = routeData.argsAs<EditCharacterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditCharacterPage(
          key: args.key,
          character: args.character,
        ),
      );
    },
    CharacterDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterDetailsRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CharacterDetailsPage(
          key: args.key,
          character: args.character,
        ),
      );
    },
    CharactersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CharactersPage(),
      );
    },
    CreateCharacterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateCharacterPage(),
      );
    },
    CharacterGeneralRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CharacterGeneralPage(),
      );
    },
    CharacterAttributesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CharacterAttributesPage(),
      );
    },
    CharacterSkillsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CharacterSkillsPage(),
      );
    },
    CharacterDisciplinesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CharacterDisciplinesPage(),
      );
    },
    CharacterOtherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CharacterOtherPage(),
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
/// [EditCharacterPage]
class EditCharacterRoute extends PageRouteInfo<EditCharacterRouteArgs> {
  EditCharacterRoute({
    Key? key,
    required Character character,
    List<PageRouteInfo>? children,
  }) : super(
          EditCharacterRoute.name,
          args: EditCharacterRouteArgs(
            key: key,
            character: character,
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
    required this.character,
  });

  final Key? key;

  final Character character;

  @override
  String toString() {
    return 'EditCharacterRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [CharacterDetailsPage]
class CharacterDetailsRoute extends PageRouteInfo<CharacterDetailsRouteArgs> {
  CharacterDetailsRoute({
    Key? key,
    required Character character,
    List<PageRouteInfo>? children,
  }) : super(
          CharacterDetailsRoute.name,
          args: CharacterDetailsRouteArgs(
            key: key,
            character: character,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDetailsRoute';

  static const PageInfo<CharacterDetailsRouteArgs> page =
      PageInfo<CharacterDetailsRouteArgs>(name);
}

class CharacterDetailsRouteArgs {
  const CharacterDetailsRouteArgs({
    this.key,
    required this.character,
  });

  final Key? key;

  final Character character;

  @override
  String toString() {
    return 'CharacterDetailsRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [CharactersPage]
class CharactersRoute extends PageRouteInfo<void> {
  const CharactersRoute({List<PageRouteInfo>? children})
      : super(
          CharactersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharactersRoute';

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
/// [CharacterGeneralPage]
class CharacterGeneralRoute extends PageRouteInfo<void> {
  const CharacterGeneralRoute({List<PageRouteInfo>? children})
      : super(
          CharacterGeneralRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterGeneralRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CharacterAttributesPage]
class CharacterAttributesRoute extends PageRouteInfo<void> {
  const CharacterAttributesRoute({List<PageRouteInfo>? children})
      : super(
          CharacterAttributesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterAttributesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CharacterSkillsPage]
class CharacterSkillsRoute extends PageRouteInfo<void> {
  const CharacterSkillsRoute({List<PageRouteInfo>? children})
      : super(
          CharacterSkillsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterSkillsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CharacterDisciplinesPage]
class CharacterDisciplinesRoute extends PageRouteInfo<void> {
  const CharacterDisciplinesRoute({List<PageRouteInfo>? children})
      : super(
          CharacterDisciplinesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterDisciplinesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CharacterOtherPage]
class CharacterOtherRoute extends PageRouteInfo<void> {
  const CharacterOtherRoute({List<PageRouteInfo>? children})
      : super(
          CharacterOtherRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterOtherRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
