import 'package:flutter/material.dart';
import 'package:vtm_assistant/ui/theme/constants.dart';

import 'common.dart';

class Counter extends StatelessWidget {
  const Counter({
    Key? key,
    this.label,
    this.isRequired = false,
    required this.value,
    this.increaseTap,
    this.decreaseTap,
  }) : super(key: key);

  final bool isRequired;
  final String? label;
  final VoidCallback? increaseTap;
  final VoidCallback? decreaseTap;

  final int value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final secondary = colorScheme.secondary;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) FieldLabel(label!, isRequired: isRequired),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: secondary,
            ),
            borderRadius:
                const BorderRadius.all(TextFieldConstants.borderRadius),
          ),
          child: Row(
            children: [
              InkWellWrapper(
                onTap: decreaseTap,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: secondary)),
                  ),
                  padding: TextFieldConstants.contentPadding
                      .copyWith(top: 0, bottom: 0),
                  child: Icon(
                    Icons.remove_rounded,
                    size: 20,
                    color: secondary.withOpacity(decreaseTap != null ? 1 : .3),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    value.toString(),
                    style: textTheme.titleLarge,
                  ),
                ),
              ),
              InkWellWrapper(
                onTap: increaseTap,
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: secondary)),
                  ),
                  padding: TextFieldConstants.contentPadding
                      .copyWith(top: 0, bottom: 0),
                  child: Icon(
                    Icons.add_rounded,
                    size: 20,
                    color: secondary.withOpacity(increaseTap != null ? 1 : .3),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
