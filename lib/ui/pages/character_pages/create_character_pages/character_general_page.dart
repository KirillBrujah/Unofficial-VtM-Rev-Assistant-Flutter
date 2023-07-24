import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/ui/theme/constants.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';
import 'package:vtm_assistant/models/models.dart';

@RoutePage()
class CharacterGeneralPage extends StatelessWidget {
  const CharacterGeneralPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: CommonConstants.pagePadding,
      child: Column(
        children: const [
          _Name(),
          SizedBox(height: 20),
          _Clan(),
          SizedBox(height: 20),
          _Generation(),
          SizedBox(height: 20),
          _Description(),
        ],
      ),
    );
  }
}

class _Name extends ConsumerWidget {
  const _Name({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      label: S.of(context).name,
      isRequired: true,
      onChanged: ref.read(createCharacterStateProvider.notifier).setName,
    );
  }
}

class _Clan extends ConsumerWidget {
  const _Clan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clans = ref.watch(clansProvider);
    final selectedClan =
        ref.watch(createCharacterStateProvider.select((state) => state.clan));

    var s = S.of(context);

    return clans.when(
      // TODO: Rework error and loading
      loading: () => const CircularProgressIndicator(),
      error: (error, stackTrace) => Text(error.toString()),
      data: (clans) {
        return CustomDropdown<Clan>(
        label: s.clan,
        hint: s.choose_clan,
        isRequired: true,
        value: selectedClan,
        items: clans,
        onChanged: ref.read(createCharacterStateProvider.notifier).setClan,
      );
      },
    );
  }
}

class _Generation extends ConsumerWidget {
  const _Generation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final generation = ref.watch(
        createCharacterStateProvider.select((state) => state.generation));
    final notifier = ref.watch(createCharacterStateProvider.notifier);
    return Counter(
      value: generation,
      label: S.of(context).generation,
      increaseTap: generation < 15
          ? () {
              notifier.setGeneration(generation + 1);
            }
          : null,
      decreaseTap: generation > 1
          ? () {
              notifier.setGeneration(generation - 1);
            }
          : null,
    );
  }
}

class _Description extends ConsumerWidget {
  const _Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomTextField(
      label: S.of(context).description,
      maxLines: 9,
      onChanged: ref.read(createCharacterStateProvider.notifier).setDescription,
    );
  }
}
