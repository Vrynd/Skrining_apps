import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/pages/account_page.dart';
import 'package:skrining_apps/pages/home_page.dart';
import 'package:skrining_apps/themes/theme_apps.dart';
import 'package:skrining_apps/pages/bottom_navbar_page.dart';
import 'package:skrining_apps/provider/bottom_navbar_provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ],
        child: MyApp(),
    ),
  );
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
      initialRoute: '/',
      routes: {
        '/': (context) => BottomNavBarPage(),
        '/home': (context) => HomePage(),
        '/account': (context) => AccountPage(),
      },
    );
  }
}
