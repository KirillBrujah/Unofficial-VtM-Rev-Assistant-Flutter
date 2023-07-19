import 'package:flutter/material.dart';
import 'text_theme.dart';

import 'dark_color_schemes/color_schemes.dart';

final kDarkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: boneColorScheme,
  textTheme: kTextTheme,
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: Colors.black,
    contentTextStyle: TextStyle(color: Colors.white)
  ),
);
