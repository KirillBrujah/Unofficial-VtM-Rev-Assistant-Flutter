import 'package:auto_route/auto_route.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
      routes: [
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
              _NavBar(tabsRouter: tabsRouter),
              Expanded(child: child),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (tabsRouter.activeIndex == 0) {
                          return;
                        }
                        tabsRouter.setActiveIndex(tabsRouter.activeIndex - 1);
                      },
                      child: const Text("Previous"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (tabsRouter.activeIndex >=
                            (tabsRouter.pageCount - 1)) {
                          return;
                        }
                        tabsRouter.setActiveIndex(tabsRouter.activeIndex + 1);
                      },
                      child: const Text("Next"),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );

    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).create_character),
      body: const _CreateBody(),
    );
  }
}

class _NavBar extends StatelessWidget {
  const _NavBar({
    super.key,
    required this.tabsRouter,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    return BottomNavyBar(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      showElevation: false,
      itemCornerRadius: 10,
      backgroundColor: Colors.transparent,
      items: [
        BottomNavyBarItem(
          icon: Center(child: Icon(Icons.add)),
          title: Text(s.general),
          activeColor: colorScheme.primary,
          inactiveColor: colorScheme.primaryContainer,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.add),
          title: Text(s.attributes),
          activeColor: colorScheme.primary,
          inactiveColor: colorScheme.primaryContainer,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.add),
          title: Text(s.skills),
          activeColor: colorScheme.primary,
          inactiveColor: colorScheme.primaryContainer,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.add),
          title: Text(s.disciplines),
          activeColor: colorScheme.primary,
          inactiveColor: colorScheme.primaryContainer,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.add),
          title: Text(s.other),
          activeColor: colorScheme.primary,
          inactiveColor: colorScheme.primaryContainer,
        ),
      ],
      selectedIndex: tabsRouter.activeIndex,
      onItemSelected: tabsRouter.setActiveIndex,
    );
  }
}

class _CreateBody extends ConsumerWidget {
  const _CreateBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createState = ref.watch(createCharacterStateProvider);
    final createStateNotifier = ref.read(createCharacterStateProvider.notifier);
    // final createController = ref.watch(createCharacterControllerProvider);

    ref.listen(createCharacterControllerProvider, (previous, next) {
      if (next.value == true) {
        context.router.pop();
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          onChanged: createStateNotifier.setName,
        ),
        const SizedBox(height: 10),
        if (createState.isReady)
          ElevatedButton(
            onPressed: createStateNotifier.create,
            child: const Text("CREATE"),
          ),
      ],
    );
  }
}
