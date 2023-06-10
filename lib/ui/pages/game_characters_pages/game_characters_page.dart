import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

@RoutePage()
class GameCharactersPage extends StatelessWidget {
  const GameCharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).characters),
      ),
      body: const _GameCharactersList(),
    );
  }
}

class _GameCharactersList extends ConsumerWidget {
  const _GameCharactersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameCharacters = ref.watch(gameCharactersProvider);

    return gameCharacters.when(
      data: (gameCharacters) => gameCharacters.isNotEmpty ? SingleChildScrollView(
        child: Column(
          children: gameCharacters
              .map((gameCharacter) => _GameCharacterCard(gameCharacter))
              .toList(),
        ),
      ) : const _Empty(),
      // TODO: Replace to kErrorWidget
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      // TODO: Replace to kLoadingWidget
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _GameCharacterCard extends StatelessWidget {
  const _GameCharacterCard(
    this.gameCharacter, {
    super.key,
  });

  final GameCharacter gameCharacter;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Text('ID = ${gameCharacter.id}'),
        const SizedBox(height: 5),
        Text(gameCharacter.name),
        const SizedBox(height: 5),
        Text(gameCharacter.clan.name),
      ],),
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

