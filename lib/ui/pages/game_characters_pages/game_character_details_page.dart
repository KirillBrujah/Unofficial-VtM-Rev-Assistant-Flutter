import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';

@RoutePage()
class GameCharacterDetailsPage extends ConsumerWidget {
  const GameCharacterDetailsPage({Key? key, required this.gameCharacter})
      : super(key: key);

  final GameCharacter gameCharacter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(gameCharacterControllerProvider.notifier).load(gameCharacter);

    return Scaffold(
      appBar: CustomAppBar(
        title: gameCharacter.name,
        action: AppBarEditAction(
          onTap: () {
            // TODO: Go to edit page
          },
        ),
      ),
      body: const _Details(),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          _Disciplines(),
        ],
      ),
    );
  }
}

class _Disciplines extends ConsumerWidget {
  const _Disciplines({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterDisciplines = ref.watch(characterDisciplinesProvider);

    return Column(
      children: characterDisciplines
          .map((discipline) => Text(discipline.discipline.name))
          .toList(),
    );
  }
}
