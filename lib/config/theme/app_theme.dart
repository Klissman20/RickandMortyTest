import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorApp = Color(0xFFDB411F);

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colorApp);
}
