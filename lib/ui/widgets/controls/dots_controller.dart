import 'package:flutter/material.dart';
import 'package:vtm_assistant/ui/theme/constants.dart';
import 'package:vtm_assistant/ui/widgets/controls/common.dart';

class DotsController extends StatelessWidget {
  const DotsController({
    Key? key,
    required this.value,
    this.maxValue = 10,
    this.label,
    required this.onChanged,
  }) : super(key: key);

  final int value;
  final int maxValue;
  final String? label;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return ControlWidget(
      label: label,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: [
          for (int i = 1; i <= maxValue; i++)
            InkResponse(
              radius: 7,
              onTap: () {
                onChanged(i);
              },
              child: _Dot(
                isSelected: i <= value,
              ),
            ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    this.isSelected = false,
  }) : super(key: key);

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final width = (MediaQuery.of(context).size.width - CommonConstants.pagePadding.horizontal);
    return SizedBox(
      width: width / 10 - .5,
      height: width / 10,
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: colorScheme.secondary.withOpacity(.5)),
            color: isSelected
                ? colorScheme.primary
                : colorScheme.primaryContainer.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
