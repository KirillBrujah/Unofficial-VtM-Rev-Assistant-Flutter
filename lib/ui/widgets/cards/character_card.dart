import 'package:flutter/material.dart';
import 'package:vtm_assistant/models/models.dart';
import 'package:vtm_assistant/ui/theme/constants.dart';
import 'package:intl/intl.dart';

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

extension _EDateTime on DateTime {
  String get date => DateFormat('dd.MM.yyyy').format(this);
}

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key, this.onTap});

  final Character character;

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
          borderRadius: BorderRadius.circular(CardConstants.borderRadius.x),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CharacterImage(character),
            Expanded(
              child: Padding(
                padding: CardConstants.contentPadding,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      character.name,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: textTheme.titleLarge!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(
                      '${character.clan.value?.name}: ${character.generation.roman}',
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      style: textTheme.bodyMedium!
                          .copyWith(color: colorScheme.onSurface),
                    ),
                    Text(
                      character.createdOn.date,
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
  const _CharacterImage(this.character, {Key? key}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: const BorderRadius.horizontal(
          left: CardConstants.borderRadius,
        ),
        border: Border.all(color: colorScheme.surface, width: 2),
      ),
      padding: CardConstants.imagePadding,
      height: CardConstants.height,
      width: CardConstants.height,
      child: Image.asset(
        character.clan.value?.logoPath ?? "",
        color: colorScheme.onBackground,
      ),
    );
  }
}
