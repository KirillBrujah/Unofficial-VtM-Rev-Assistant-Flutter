import 'package:flutter/material.dart';

class ControlWidget extends StatelessWidget {
  const ControlWidget({
    Key? key,
    this.isRequired = false,
    this.label,
    this.labelPadding = const EdgeInsets.only(bottom: 8),
    required this.child,
  }) : super(key: key);

  final bool isRequired;
  final String? label;
  final Widget child;
  final EdgeInsets labelPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null)
          FieldLabel(
            label!,
            padding: labelPadding,
            isRequired: isRequired,
          ),
        child,
      ],
    );
  }
}

class FieldLabel extends StatelessWidget {
  const FieldLabel(
    this.label, {
    Key? key,
    this.isRequired = false,
    this.padding = const EdgeInsets.only(bottom: 8),
  }) : super(key: key);

  final bool isRequired;
  final String label;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        '$label ${isRequired ? '*' : ""}'.trim(),
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

class InkWellWrapper extends StatelessWidget {
  const InkWellWrapper({Key? key, required this.child, this.onTap})
      : super(key: key);

  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}
