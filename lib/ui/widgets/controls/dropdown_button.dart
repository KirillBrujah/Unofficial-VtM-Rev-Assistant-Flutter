import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:vtm_assistant/ui/theme/constants.dart';
import 'package:vtm_assistant/ui/widgets/controls/common.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    Key? key,
    this.label,
    this.isRequired = false,
    required this.items,
    this.value,
    this.onChanged, this.hint,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final bool isRequired;
  final List<T> items;
  final T? value;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    var secondary = Theme.of(context).colorScheme.secondary;
    var primary = Theme.of(context).colorScheme.primary;
    return ControlWidget(
      label: label,
      isRequired: isRequired,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<T>(
          onChanged: onChanged,
          value: value,
          // TODO: Change hint
          hint: hint != null ? Text(
            hint!,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: secondary),
          ) : null,
          isExpanded: true,
          buttonStyleData: ButtonStyleData(
            decoration: BoxDecoration(
              border: Border.all(color: secondary),
              borderRadius:
                  const BorderRadius.all(TextFieldConstants.borderRadius),
            ),
          ),
          iconStyleData: IconStyleData(
            iconDisabledColor: secondary,
            iconEnabledColor: secondary,
            iconSize: 30,
            icon: const Padding(
              padding: TextFieldConstants.contentPadding,
              child: Icon(Icons.arrow_drop_down_rounded),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              border: Border.all(color: secondary),
              borderRadius:
                  const BorderRadius.all(TextFieldConstants.borderRadius),
            ),
            maxHeight: 400,
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(secondary),
            ),
            // elevation: 2,
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: TextFieldConstants.contentPadding,
            selectedMenuItemBuilder: (context, child) {
              return Padding(
                padding: TextFieldConstants.contentPadding,
                child: Text(
                  value.toString(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: primary,
                      ),
                ),
              );
            },
          ),
          items: items
              .map((e) => DropdownMenuItem<T>(
                    value: e,
                    child: Text(e.toString()),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
