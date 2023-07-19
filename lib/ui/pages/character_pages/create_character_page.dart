import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:vtm_assistant/providers/providers.dart';
import 'package:vtm_assistant/ui/widgets/widgets.dart';

@RoutePage()
class CreateCharacterPage extends StatelessWidget {
  const CreateCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).create_character),
      body: const _CreateBody(),
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
