import 'package:flutter/material.dart';
import 'package:vtm_assistant/models/models.dart';

extension _EGeneration on int {
  String get roman {
    assert(this > 0 && this < 16);

    final numbers = {
      1: "I",
      2: "II",
      3: "III",
      4: "IV",
      5: "V",
      6: "VI",
      7: "VII",
      8: "VIII",
      9: "IX",
      10: "X",
      11: "XI",
      12: "XII",
      13: "XIII",
      14: "XIV",
      15: "XV",
    };
    return numbers[this]!;
  }
}

class GameCharacterCard extends StatelessWidget {
  const GameCharacterCard(this.gameCharacter, {super.key});

  final GameCharacter gameCharacter;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: colorScheme.background,
            height: 90,
            width: 90,
            // TODO: Replace with image
            child: const Placeholder(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    gameCharacter.name,
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge!.copyWith(
                      color: colorScheme.error,
                    ),
                  ),
                  // const SizedBox(height: 5),
                  Text(
                    '${gameCharacter.clan.name}: ${gameCharacter.generation.roman}',
                    style: textTheme
                        .labelMedium /*.copyWith(color: colorScheme.secondary)*/,
                  ),
                  // const SizedBox(height: 5),
                  // TODO: Change character date
                  Text(
                    '16.04.2023',
                    textAlign: TextAlign.end,
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
