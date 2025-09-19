import 'package:flutter/material.dart';
import 'package:skrining_apps/themes/theme_apps.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skrining App',
      theme: ThemeApps.lightTheme,
      darkTheme: ThemeApps.darkTheme,
      themeMode: ThemeMode.system,
      home: const Scaffold(),
    );
  }
}