import 'package:flutter/material.dart';

class SimpleErrorMessage extends StatelessWidget {
  const SimpleErrorMessage(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Text(
      message,
      style: textTheme.labelMedium?.copyWith(
        color: colorScheme.error,
      ),
    );
  }
}
