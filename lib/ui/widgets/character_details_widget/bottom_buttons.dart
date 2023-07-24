import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vtm_assistant/generated/l10n.dart';
import 'package:vtm_assistant/providers/providers.dart';

class DetailsBottomButtons extends ConsumerWidget {
  const DetailsBottomButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = S.of(context);
    final isReady = ref
        .watch(createCharacterStateProvider.select((state) => state.isReady));
    return Container(
      decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: context.router.pop,
              child: Text(s.cancel),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: ref.read(createCharacterStateProvider.notifier).save,
              child: Text(isReady ? s.save : "Not compltede"),
            ),
          ),
        ],
      ),
    );
  }
}
