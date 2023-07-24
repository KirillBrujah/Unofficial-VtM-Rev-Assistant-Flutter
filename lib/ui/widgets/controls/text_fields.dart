import 'package:flutter/material.dart';

import 'common.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.label,
    this.isRequired = false,
    this.onChanged,
    this.minLines,
    this.maxLines = 1,
  }) : super(key: key);

  final String? label;
  final bool isRequired;
  final int? minLines;
  final int? maxLines;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ControlWidget(
      label: label,
      isRequired: isRequired,
      child: TextField(
        onChanged: onChanged,
        minLines: minLines,
        maxLines: maxLines,
      ),
    );
  }
}
