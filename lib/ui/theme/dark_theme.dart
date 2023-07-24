import 'package:flutter/material.dart';
import 'package:vtm_assistant/ui/theme/constants.dart';
import 'text_theme.dart';

import 'dark_color_schemes/color_schemes.dart';

final kDarkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: boneColorScheme,
  textTheme: kTextTheme,
  snackBarTheme: _snackBarThemeData,
  inputDecorationTheme: _inputDecorationTheme,
);

// TODO: Rework Snack Bar theme
const _snackBarThemeData = SnackBarThemeData(
  backgroundColor: Colors.black,
  contentTextStyle: TextStyle(color: Colors.white),
);

const _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(TextFieldConstants.borderRadius),
  ),
);
