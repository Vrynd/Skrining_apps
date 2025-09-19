import 'package:flutter/material.dart';
import 'package:skrining_apps/themes/theme_apps.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Lihat Profil Saya'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            // go to profile page
            onTap: () => {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Ganti Password'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            // go to change password page
            onTap: () => {},
          ),
          const Divider(),
          // Logout
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout'),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}

  // void _showMessage(BuildContext context, String message) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(content: Text(message)),
  //   );
  // }