import 'package:flutter/material.dart';

extension ContextSnackBar on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Function(
      SnackBar snackBar) get showSnackBar => ScaffoldMessenger.of(this).showSnackBar;

  void snackSuccess(String message) {
    showSnackBar(_SnackBars.success(this, message));
  }

  void snackInfo(String message) {
    showSnackBar(_SnackBars.info(this, message));
  }

  void snackError(String message) {
    showSnackBar(_SnackBars.error(this, message));
  }
}

class _SnackBars {
  static SnackBar error(BuildContext context, String message) => SnackBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        content: _Label(message, color: _LabelColours.error(context)),
      );

  static SnackBar success(BuildContext context, String message) => SnackBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        content: _Label(message, color: _LabelColours.success(context)),
      );

  static SnackBar info(BuildContext context, String message) => SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        content: _Label(message, color: _LabelColours.info(context)),
      );
}

class _Label extends StatelessWidget {
  const _Label(
    this.message, {
    required this.color,
  });

  final String message;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: color),
    );
  }
}

class _LabelColours {
  static Color error(BuildContext context) =>
      Theme.of(context).colorScheme.onError;

  static Color success(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondary;

  static Color info(BuildContext context) =>
      Theme.of(context).colorScheme.onPrimary;
}
