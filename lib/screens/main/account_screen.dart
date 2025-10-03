import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/components/widget/tile_section.dart';
import 'package:skrining_apps/components/widget/tile_card.dart';

import 'package:skrining_apps/components/widget/scaffold_widget.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';
import 'package:skrining_apps/provider/shared_prefrences_provider.dart';

import 'package:skrining_apps/screens/routes/route_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

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
    return ScaffoldWigdet(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Akun Saya',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                TileSection(
                  children: [
                    TileCard(
                      icon: Icons.person_outline,
                      lightColor: Colors.blue,
                      darkColor: Colors.blue.shade200,
                      title: "Profil Saya",
                      onTap: () => Navigator.pushNamed(
                        context,
                        RouteScreen.profile.name,
                      ),
                    ),
                    TileCard(
                      icon: Icons.lock_outline,
                      lightColor: Colors.orange,
                      darkColor: Colors.orange.shade200,
                      title: "Ganti Password",
                      onTap: () => Navigator.pushNamed(
                        context,
                        RouteScreen.changePassword.name,
                      ),
                    ),
                    TileCard(
                      icon: Icons.info_outline,
                      lightColor: Colors.teal,
                      darkColor: Colors.teal.shade200,
                      title: "Tentang Aplikasi",
                      onTap: () {},
                    ),
                  ],
                ),
                SizedBox(height: 16),

                TileSection(
                  children: [
                    TileCard(
                      icon: Icons.notification_add_outlined,
                      lightColor: Colors.purple,
                      darkColor: Colors.purple.shade200,
                      title: "Notifikasi",
                      isSwitch: true,
                      switchValue: false,
                      onSwitchChanged: (value) {},
                    ),
                    TileCard(
                      icon: Icons.dark_mode_outlined,
                      lightColor: Colors.indigo,
                      darkColor: Colors.indigo.shade200,
                      title: "Mode Gelap",
                      isSwitch: true,
                      switchValue: false,
                      onSwitchChanged: (val) {},
                    ),
                  ],
                ),
                SizedBox(height: 16),

                TileSection(
                  children: [
                    TileCard(
                      icon: Icons.power_settings_new_outlined,
                      lightColor: Colors.red,
                      darkColor: Colors.red.shade300,
                      title: "Keluar Akun",
                      onTap: () {
                        _tapToSignOut(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
