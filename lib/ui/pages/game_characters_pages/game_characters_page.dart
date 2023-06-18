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
      body: const _GameCharactersBody(),
      floatingActionButton: _AddCharacter(),
    );
  }
}

class _GameCharactersBody extends ConsumerWidget {
  const _GameCharactersBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameCharactersController =
        ref.watch(gameCharactersControllerProvider);

    final gameCharacters = ref.watch(gameCharactersProvider);

    return gameCharactersController.when(
      data: (_) => gameCharacters.isNotEmpty
          ? _GameCharactersList(data: gameCharacters)
          : const _Empty(),
      // TODO: Replace to kErrorWidget
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      // TODO: Replace to kLoadingWidget
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _GameCharactersList extends StatelessWidget {
  const _GameCharactersList({Key? key, required this.data}) : super(key: key);

  final List<GameCharacter> data;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) => GameCharacterCard(data[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: data.length,
    );
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: data.map((item) => GameCharacterCard(item)).toList(),
      ),
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

class _AddCharacter extends ConsumerStatefulWidget {
  const _AddCharacter({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => __AddCharacterState();
}

class __AddCharacterState extends ConsumerState<_AddCharacter> {
  int _clanId = 1;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        ref
            .read(gameCharactersControllerProvider.notifier)
            .addCharacter(GameCharacter(
              name: "TEst",
              generation: 12,
              clan: Clan(id: _clanId, name: "asd"),
            ));
        setState(() {
          _clanId++;
        });

        // TODO: Call create character from Provider
        // ref.read(c)
      },
      child: const Icon(Icons.add),
    );
  }
}
