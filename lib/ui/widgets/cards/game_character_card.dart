import 'package:flutter/material.dart';
import 'package:vtm_assistant/gen/assets.gen.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/ui/theme/constants.dart';

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
  const GameCharacterCard(this.gameCharacter, {super.key, this.onTap});

  final GameCharacter gameCharacter;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: CardConstants.height,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(CardConstants.borderRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CharacterImage(gameCharacter),
            Expanded(
              child: Padding(
                padding: CardConstants.contentPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      gameCharacter.name,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: textTheme.titleLarge!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(
                      '${gameCharacter.clan.value!.name}: ${gameCharacter.generation.roman}',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: textTheme.bodyMedium!
                          .copyWith(color: colorScheme.onSurface),
                    ),
                    // TODO: Change character date
                    Text(
                      '16.04.2023',
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withOpacity(.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CharacterImage extends StatelessWidget {
  const _CharacterImage(this.gameCharacter, {Key? key}) : super(key: key);

  final GameCharacter gameCharacter;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(
            CardConstants.borderRadius,
          ),
        ),
      ),
      padding: CardConstants.imagePadding,
      height: CardConstants.height,
      width: CardConstants.height,
      child: Image.asset(gameCharacter.clan.value!.logoPath),
    );
  }
}
