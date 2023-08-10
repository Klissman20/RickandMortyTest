import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorApp = Color(0xFF2862F5);

  ThemeData getTheme() =>
      ThemeData(useMaterial3: true, colorSchemeSeed: colorApp);
}
