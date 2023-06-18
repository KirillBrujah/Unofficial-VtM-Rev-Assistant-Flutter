import 'package:flutter/material.dart';

// onPrimary    #
// onPrimary2   #
// primary      #DAC3A4 218, 195, 164
// primary2     #70553A 112, 85, 58
// secondary    #7B0B0A 123, 11, 10
// secondary2   #7C7E8A 124, 126, 138
// background   #090B08 9, 11, 8
// surface      #


const _primary = Color.fromRGBO(207, 28, 8, 1);
const _primaryContainer = Color.fromRGBO(123, 11, 10, 1);
const _onPrimary = _secondary; // #F7E1DF
const _secondary = Color.fromRGBO(218, 195, 164, 1);
const _onSecondary = _primary;
const _error = Color.fromRGBO(207, 28, 8, 1);
const _onError = Color.fromRGBO(247, 225, 223, 1);
const _background = Color.fromRGBO(9, 11, 8, 1);
const _onBackground = _secondary;
const _surface = Color.fromRGBO(112, 85, 58, .2);
const _onSurface = _secondary;

const boneColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: _primary,
  primaryContainer: _primaryContainer,
  onPrimary: _onPrimary,
  secondary: _secondary,
  onSecondary: _onSecondary,
  error: _error,
  onError: _onError,
  background: _background,
  onBackground: _onBackground,
  surface: _surface,
  onSurface: _onSurface,
);
