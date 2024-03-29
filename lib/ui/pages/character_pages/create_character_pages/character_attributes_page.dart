import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/ui/theme/constants.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';

@RoutePage()
class CharacterAttributesPage extends StatelessWidget {
  const CharacterAttributesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _Attributes();
  }
}

class _Attributes extends ConsumerWidget {
  const _Attributes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final attributesController =
        ref.watch(characterAttributesControllerProvider);
    return attributesController.when(
      loading: () => const Loading(),
      error: (error, stackTrace) => SimpleErrorMessage(error.toString()),
      data: (data) => _AttributesList(list: data),
    );
  }
}

class _AttributesList extends StatelessWidget {
  const _AttributesList({Key? key, required this.list}) : super(key: key);

  final List<AttributeModel> list;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return SingleChildScrollView(
      padding: CommonConstants.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TypeLabel(s.physical),
          for (AttributeModel attribute
              in list.where((element) => element.isPhysical))
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
            ),
          const SizedBox(height: 5),
          TypeLabel(s.social),
          for (AttributeModel attribute
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
            ),
          const SizedBox(height: 5),
          TypeLabel(s.mental),
          for (AttributeModel attribute
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
            ),
        ],
      ),
    );
  }
}