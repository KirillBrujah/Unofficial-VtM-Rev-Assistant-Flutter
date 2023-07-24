import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/providers/providers.dart';

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
      // TODO: Rework error and loading widgets
      loading: () => CircularProgressIndicator(),
      error: (error, stackTrace) => Text(error.toString()),
      data: (data) => _AttributesList(list: data),
    );
  }
}

class _AttributesList extends StatelessWidget {
  const _AttributesList({Key? key, required this.list}) : super(key: key);

  final List<AttributeModel> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Physical"),
        for (AttributeModel attribute in list.where((element) => element.isPhysical))
          Column(
            children: [
              Text(attribute.name),
              Row(
                children: [
                  Text(attribute.value.toString()),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) =>
                            ElevatedButton(
                      onPressed: () {
                        ref
                            .read(
                                characterAttributesControllerProvider.notifier)
                            .setValue(attribute.id, attribute.value + 1);
                      },
                      child: Text("INC"),
                    ),
                  ),
                ],
              )
            ],
          ),
        Text("Social"),
        for (AttributeModel attribute in list.where((element) => element.isSocial))
          Column(
            children: [
              Text(attribute.name),
              Row(
                children: [
                  Text(attribute.value.toString()),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) =>
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(
                                characterAttributesControllerProvider.notifier)
                                .setValue(attribute.id, attribute.value + 1);
                          },
                          child: Text("INC"),
                        ),
                  ),
                ],
              )
            ],
          ),
        Text("Mental"),
        for (AttributeModel attribute in list.where((element) => element.isMental))
          Column(
            children: [
              Text(attribute.name),
              Row(
                children: [
                  Text(attribute.value.toString()),
                  Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) =>
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(
                                characterAttributesControllerProvider.notifier)
                                .setValue(attribute.id, attribute.value + 1);
                          },
                          child: Text("INC"),
                        ),
                  ),
                ],
              )
            ],
          ),
      ],
    );
  }
}
