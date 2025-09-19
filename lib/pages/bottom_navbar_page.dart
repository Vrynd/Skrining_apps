import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/pages/account_page.dart';
import 'package:skrining_apps/pages/home_page.dart';
import 'package:skrining_apps/provider/bottom_navbar_provider.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavBarProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(title: Text("Selamat Datang")),
          body: IndexedStack(
            index: value.selectedIndex,
            children: [
              Navigator(
                onGenerateRoute: (route) {
                  if (route.name == '/home') {
                    return MaterialPageRoute(builder: (_) => HomePage());
                  }
                  return MaterialPageRoute(builder: (_) => AccountPage());
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value.selectedIndex,
            onTap: (index) {
              value.setSelectedIndex(index);
              if (index == 0) {
                Navigator.pushNamed(context, '/home');
              } else {
                Navigator.pushNamed(context, '/account');
              }
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Akun Saya',
              ),
            ],
          ),
        );
      },
    );
  }
}
