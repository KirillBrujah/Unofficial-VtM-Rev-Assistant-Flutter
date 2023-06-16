import 'package:flutter/material.dart';

// onPrimary    #F7E1DF 247, 225, 223
// onPrimary2   #F7E1DF 247, 225, 223 40%
// primary      #CF1C08 207, 28, 8
// primary2     #A81707 168, 23, 7
// secondary    #453938 69, 57, 56
// background   #260502 38, 5, 2
// surface      #360702 54, 7, 2

const _primary = Color.fromRGBO(207, 28, 8, 1);
const _onPrimary = Color.fromRGBO(247, 225, 223, 1); // #F7E1DF
const _secondary = Color.fromRGBO(69, 57, 56, 1);
const _onSecondary = _onPrimary;
const _error = _primary;
const _onError = _onPrimary;
const _background = Color.fromRGBO(38, 5, 2, 1);
const _onBackground = _onPrimary;
const _surface = Color.fromRGBO(54, 7, 2, 1);
const _onSurface = _onPrimary;

const bloodColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: _primary,
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
