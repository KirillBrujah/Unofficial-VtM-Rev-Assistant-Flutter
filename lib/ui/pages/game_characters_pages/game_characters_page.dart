import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';
import 'package:vtm_assistant/utils/app_router.dart';

@RoutePage()
class GameCharactersPage extends StatelessWidget {
  const GameCharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: S.of(context).characters,
        action: AppBarAddAction(
          onTap: () {
            context.router.push(const CreateCharacterRoute());
          },
        ),
      ),
      body: const _Clans(),
    );
  }
}

class _GameCharactersBody extends ConsumerWidget {
  const _GameCharactersBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Placeholder();
    //
    // final gameCharactersController =
    //     ref.watch(gameCharactersControllerProvider);
    //
    // final gameCharacters = ref.watch(gameCharactersProvider);
    //
    // return gameCharactersController.when(
    //   data: (_) => gameCharacters.isNotEmpty
    //       ? _GameCharactersList(data: gameCharacters)
    //       : const _Empty(),
    //   // TODO: Replace to kErrorWidget
    //   error: (error, stackTrace) => Center(child: Text(error.toString())),
    //   // TODO: Replace to kLoadingWidget
    //   loading: () => const Center(child: CircularProgressIndicator()),
    // );
  }
}

// TODO: Remove this widget
class _Clans extends ConsumerWidget {
  const _Clans({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clans = ref.watch(clansProvider);
    return clans.when(
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text(error.toString()),
      data: (data) => SingleChildScrollView(
        child: Column(
          children: data
              .map((clan) => Row(
                    children: [
                      Expanded(child: Text(clan.name)),
                      Image.asset(
                        color: Theme.of(context).colorScheme.onBackground,
                        clan.logoPath,
                        width: 100,
                        height: 100,
                      ),
                    ],
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class _GameCharactersList extends StatelessWidget {
  const _GameCharactersList({Key? key, required this.data}) : super(key: key);

  final List<GameCharacter> data;

  VoidCallback _handleTap(
    BuildContext context,
    GameCharacter gameCharacter,
  ) =>
      () {
        context.router
            .push(GameCharacterDetailsRoute(gameCharacter: gameCharacter));
      };

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) => GameCharacterCard(
        data[index],
        onTap: _handleTap(context, data[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: data.length,
    );
  }
}

// TODO: Rework empty message widget
class _Empty extends StatelessWidget {
  const _Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("EMPTY"));
  }
}
