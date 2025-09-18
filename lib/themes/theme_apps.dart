import 'package:flutter/material.dart';
import 'package:skrining_apps/themes/font_apps.dart';

class ThemeApps {
  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: FontOverpass.displayLarge,
      displayMedium: FontOverpass.displayMedium,
      displaySmall: FontOverpass.displaySmall,
      headlineLarge: FontOverpass.headlineLarge,
      headlineMedium: FontOverpass.headlineMedium,
      headlineSmall: FontOverpass.headlineSmall,
      titleLarge: FontOverpass.titleLarge,
      titleMedium: FontOverpass.titleMedium,
      titleSmall: FontOverpass.titleSmall,
      bodyLarge: FontOverpass.bodyLarge,
      bodyMedium: FontOverpass.bodyMedium,
      bodySmall: FontOverpass.bodySmall,
      labelLarge: FontOverpass.labelLarge,
      labelMedium: FontOverpass.labelMedium,
      labelSmall: FontOverpass.labelSmall,
    );
  }

  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1565C0),
      brightness: Brightness.light,
    ),
    textTheme: _textTheme,
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1565C0),
      brightness: Brightness.dark,
    ),
    textTheme: _textTheme,
    useMaterial3: true,
  );
}
