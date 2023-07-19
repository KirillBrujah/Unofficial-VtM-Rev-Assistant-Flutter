import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';
import 'package:vtm_assistant/utils/app_router.dart';

@RoutePage()
class CharactersPage extends StatelessWidget {
  const CharactersPage({Key? key}) : super(key: key);

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
      body: const _CharactersBody(),
    );
  }
}

class _CharactersBody extends ConsumerWidget {
  const _CharactersBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characters = ref.watch(charactersProvider);

    return characters.when(
      data: (characters) => characters.isNotEmpty
          ? _CharactersList(characters: characters)
          : const _Empty(),
      // TODO: Replace to kErrorWidget
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      // TODO: Replace to kLoadingWidget
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _CharactersList extends StatelessWidget {
  const _CharactersList({
    Key? key,
    required this.characters,
  }) : super(key: key);

  final List<Character> characters;

  VoidCallback _handleTap(
    BuildContext context,
    Character character,
  ) =>
      () {
        context.router
            .push(CharacterDetailsRoute(character: character));
      };

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(15),
      itemBuilder: (context, index) => CharacterCard(
        characters[index],
        onTap: _handleTap(context, characters[index]),
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: characters.length,
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
