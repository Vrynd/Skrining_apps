import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';
import 'package:skrining_apps/provider/shared_prefrences_provider.dart';
import 'package:skrining_apps/screens/routes/route_screen.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void _tapToSignOut(BuildContext context) async {
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
            SnackBar(
              content: Text(firebaseAuthProvider.message ?? "",),
              behavior: SnackBarBehavior.floating,
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profil Saya'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(context, RouteScreen.profile.name);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Ganti Password'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(context, RouteScreen.changePassword.name);
                },
              ),
              const Divider(),
              // Logout
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.red),
                title: const Text('Logout'),
                onTap: () => _tapToSignOut(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}