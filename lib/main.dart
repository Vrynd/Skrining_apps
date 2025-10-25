import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skrining_apps/firebase_options.dart';
import 'package:skrining_apps/provider/bottom_navbar_provider.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';
import 'package:skrining_apps/provider/generate_tips_provider.dart';
import 'package:skrining_apps/provider/prediction_provider.dart';
import 'package:skrining_apps/provider/question_provider.dart';
import 'package:skrining_apps/provider/result_provider.dart';
import 'package:skrining_apps/provider/shared_prefrences_provider.dart';
import 'package:skrining_apps/provider/show_hide_password_provider.dart';
import 'package:skrining_apps/provider/static_tips_provider.dart';
import 'package:skrining_apps/provider/time_provider.dart';
import 'package:skrining_apps/screens/auth/forgot_password.dart';
import 'package:skrining_apps/screens/auth/login_screen.dart';
import 'package:skrining_apps/screens/auth/register_screen.dart';
import 'package:skrining_apps/screens/details/change_password_screen.dart';
import 'package:skrining_apps/screens/details/profile_screen.dart';
import 'package:skrining_apps/screens/main/navigation_screen.dart';
import 'package:skrining_apps/screens/main/question_screen.dart';
import 'package:skrining_apps/screens/main/result_screen.dart';
import 'package:skrining_apps/screens/routes/route_screen.dart';
import 'package:skrining_apps/service/api_service.dart';
import 'package:skrining_apps/service/firebase_auth_service.dart';
import 'package:skrining_apps/service/question_service.dart';
import 'package:skrining_apps/service/shared_preferences_service.dart';
import 'package:skrining_apps/service/static_tips_service.dart';
import 'package:skrining_apps/service/tips_service.dart';
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
        ChangeNotifierProvider(create: (context) => TimeProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
        Provider<QuestionService>(create: (context) => QuestionService()),
        ChangeNotifierProvider(
          create: (context) =>
              QuestionProvider(context.read<QuestionService>()),
        ),
        Provider<ApiServices>(create: (context) => ApiServices()),
        ChangeNotifierProvider(
          create: (context) => PredictionProvider(context.read<ApiServices>())),
        Provider<TipsService>(create: (context) => TipsService()),
        ChangeNotifierProvider(
          create: (context) => GenerateTipsProvider(context.read<TipsService>())),
        Provider<StaticTipsService>(create: (context) => StaticTipsService()),
        ChangeNotifierProvider(
          create: (context) => StaticTipsProvider(context.read<StaticTipsService>())),
        ChangeNotifierProvider(create: (context) => ResultProvider()),
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
        RouteScreen.home.name: (context) => const NavigationScreen(),
        RouteScreen.profile.name: (context) => ProfileScreen(),
        RouteScreen.changePassword.name: (context) => ChangePasswordScreen(),
        RouteScreen.forgotPassword.name: (context) =>
            const ForgotPasswordScreen(),
        RouteScreen.question.name: (context) => QuestionScreen(),
        RouteScreen.result.name: (context) {
          final args = ModalRoute.of(context)?.settings.arguments as Map<String,dynamic>? ?? {};
          final List<dynamic> data1 = args['inputData'];
          final List<dynamic> data2 = args['data'];
          return ResultScreen(
            inputData: data1,
            data: data2,
          );
        },
      },
    );
  }
}
