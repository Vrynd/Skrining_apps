import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:skrining_apps/components/widget/scaffold_widget.dart';
import 'package:skrining_apps/provider/bottom_navbar_provider.dart';
import 'package:skrining_apps/screens/main/account_screen.dart';
import 'package:skrining_apps/screens/main/history_screen.dart';
import 'package:skrining_apps/screens/main/home_screen.dart';
import 'package:skrining_apps/screens/main/scrining_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, nav, child) {
        return ScaffoldWigdet(
          body: switch (nav.selectedIndex) {
            0 => const HomeScreen(),
            1 => const ScriningScreen(),
            2 => const HistoryScreen(),
            3 => const AccountScreen(),
            _ => const HomeScreen(),
          },
          bottomNavigationBar: SalomonBottomBar(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerLowest,
            currentIndex: nav.selectedIndex,
            onTap: (i) => nav.setSelectedIndex(i),
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.explore_outlined, size: 28),
                title: Text(
                  "Beranda",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: Theme.of(context).colorScheme.secondary,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.health_and_safety_outlined, size: 28),
                title: Text(
                  "Skrining",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: Theme.of(context).colorScheme.secondary,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.history_outlined, size: 28),
                title: Text(
                  "Riwayat",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: Theme.of(context).colorScheme.secondary,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.account_circle_outlined, size: 28),
                title: Text(
                  "Akun Saya",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                unselectedColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        );
      },
    );
  }
}
