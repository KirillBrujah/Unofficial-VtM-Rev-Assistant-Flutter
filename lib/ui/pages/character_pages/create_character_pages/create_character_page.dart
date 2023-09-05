import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';
import 'package:vtm_assistant/utils/app_router.dart';

@RoutePage()
class CreateCharacterPage extends StatelessWidget {
  const CreateCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        CharacterGeneralRoute(),
        CharacterAttributesRoute(),
        CharacterSkillsRoute(),
        CharacterDisciplinesRoute(),
        CharacterOtherRoute(),
      ],
      builder: (context, child, pageController) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: Column(
            children: [
              DetailsNavBar(tabsRouter: tabsRouter),
              _Body(child: child),
              const DetailsBottomButtons(),
            ],
          ),
        );
      },
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(networkCharacterControllerServiceProvider, (_, next) {
      next.mapOrNull(
        error: (error) {
          context.snackError(error.error.toString());
        },
      );
    });

    ref.listen(dbCharactersControllerProvider, (_, next) {
      next.mapOrNull(
        error: (error) {
          context.snackError(error.error.toString());
        },
        data: (data) {
          data.value.mapOrNull(
            added: (value) {
              context.snackSuccess(
                  S.of(context).character_was_created(value.character.name));
              context.router.pop();
            },
          );
        },
      );
    });
    return Expanded(child: child);
  }
}
