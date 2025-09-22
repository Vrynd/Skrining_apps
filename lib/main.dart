import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skrining_apps/pages/password_change_page.dart';
import 'package:skrining_apps/pages/profile_page.dart';
import 'package:skrining_apps/provider/user_profile_provider.dart';
import 'package:skrining_apps/pages/bottom_navbar_page.dart';
import 'package:skrining_apps/provider/bottom_navbar_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skrining_apps/firebase_options.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';
import 'package:skrining_apps/provider/shared_prefrences_provider.dart';
import 'package:skrining_apps/provider/show_hide_password_provider.dart';
import 'package:skrining_apps/screens/auth/login_screen.dart';
import 'package:skrining_apps/screens/auth/register_screen.dart';
import 'package:skrining_apps/screens/main/home_screen.dart';
import 'package:skrining_apps/screens/routes/route_screen.dart';
import 'package:skrining_apps/service/firebase_auth_service.dart';
import 'package:skrining_apps/service/shared_preferences_service.dart';
import 'package:skrining_apps/themes/theme_apps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  final firebaseAuth = FirebaseAuth.instance;
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => FirebaseAuthService(firebaseAuth)),
        ChangeNotifierProvider(
          create: (context) =>
              FirebaseAuthProvider(context.read<FirebaseAuthService>()),
        ),
        Provider(create: (context) => SharedPreferencesService(pref)),
        ChangeNotifierProvider(
          create: (context) => SharedPreferenceProvider(
            context.read<SharedPreferencesService>(),
          ),
        ),
        ChangeNotifierProvider(create: (context) => ShowHidePasswordProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (context) => UserProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skrining Apps',
      theme: ThemeApps.lightTheme,
      darkTheme: ThemeApps.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: RouteScreen.login.name,
      routes: {
        RouteScreen.login.name: (context) => const LoginScreen(),
        RouteScreen.register.name: (context) => const RegisterScreen(),
        RouteScreen.home.name: (context) => const BottomNavBarPage(),
        '/profile': (context) => ProfilePage(),
        '/change-password': (context) => PasswordChangePage(),
      },
    );
  }
}
