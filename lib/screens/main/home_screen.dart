import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/provider/shared_prefrences_provider.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';
import 'package:skrining_apps/screens/routes/route_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello, world!'),
            ElevatedButton.icon(
              onPressed: _tapToSignOut,
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void _tapToSignOut() async {
    final sharedPreferenceProvider = context.read<SharedPreferenceProvider>();
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    await firebaseAuthProvider
        .signOutUser()
        .then((value) async {
          await sharedPreferenceProvider.logout();
          navigator.pushReplacementNamed(RouteScreen.login.name);
        })
        .whenComplete(() {
          scaffoldMessenger.showSnackBar(
            SnackBar(content: Text(firebaseAuthProvider.message ?? "")),
          );
        });
  }
}
