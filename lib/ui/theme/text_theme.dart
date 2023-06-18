import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _alice = GoogleFonts.alice;
const _notoSans = GoogleFonts.notoSans;

final kTextTheme = TextTheme(
  displayLarge: _alice(fontSize: 57),
  displayMedium: _alice(fontSize: 45),
  displaySmall: _alice(fontSize: 36),
  headlineLarge: _alice(fontSize: 32),
  headlineMedium: _alice(fontSize: 28),
  headlineSmall: _alice(fontSize: 24),
  titleLarge: _alice(fontSize: 22, fontWeight: FontWeight.w500),
  titleMedium: _alice(fontSize: 16, fontWeight: FontWeight.w500),
  titleSmall: _alice(fontSize: 14, fontWeight: FontWeight.w500),
  labelLarge: _notoSans(fontSize: 14, fontWeight: FontWeight.w500),
  labelMedium: _notoSans(fontSize: 12, fontWeight: FontWeight.w500),
  labelSmall: _notoSans(fontSize: 11, fontWeight: FontWeight.w500),
  bodyLarge: _notoSans(fontSize: 16),
  bodyMedium: _notoSans(fontSize: 14),
  bodySmall: _notoSans(fontSize: 12),
);