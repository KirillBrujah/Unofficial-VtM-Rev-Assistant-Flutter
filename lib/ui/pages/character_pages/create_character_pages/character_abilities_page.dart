import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/ui/theme/theme.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';
import 'package:vtm_assistant/utils/enums.dart';

@RoutePage()
class CharacterAbilitiesPage extends StatelessWidget {
  const CharacterAbilitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Abilities();
  }
}

class _Abilities extends ConsumerWidget {
  const _Abilities({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final abilities = ref.watch(abilitiesProvider);
    return abilities.when(
      loading: () => const Loading(),
      error: (error, stackTrace) => SimpleErrorMessage(error.toString()),
      data: (data) => _AbilitiesList(data: data),
    );
  }
}


class _AbilitiesList extends StatelessWidget {
  const _AbilitiesList({super.key, required this.data});

  final List<Ability> data;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SingleChildScrollView(
      padding: CommonConstants.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TypeLabel(s.physical),
          /*for (AttributeModel attribute
          in data.where((element) => element.type == AbilityTypes.talents))
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: DotsController(
                      label: attribute.name,
                      value: attribute.value,
                      onChanged: (value) {
                        ref
                            .read(characterAttributesControllerProvider.notifier)
                            .setValue(attribute.id, value);
                      },
                    ),
                  ),
            ),*/
          const SizedBox(height: 5),
          TypeLabel(s.social),
          /*for (AttributeModel attribute
          in list.where((element) => element.isSocial))
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: DotsController(
                      label: '${attribute.name} = ${attribute.value}',
                      value: attribute.value,
                      onChanged: (value) {
                        ref
                            .read(characterAttributesControllerProvider.notifier)
                            .setValue(attribute.id, value);
                      },
                    ),
                  ),
            ),*/
          const SizedBox(height: 5),
          TypeLabel(s.mental),
          /*for (AttributeModel attribute
          in list.where((element) => element.isMental))
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: DotsController(
                      label: attribute.name,
                      value: attribute.value,
                      onChanged: (value) {
                        ref
                            .read(characterAttributesControllerProvider.notifier)
                            .setValue(attribute.id, value);
                      },
                    ),
                  ),
            ),*/
        ],
      ),
    );
  }
}
