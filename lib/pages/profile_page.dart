import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/provider/user_profile_provider.dart';
// import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProfileProvider>(context);
    // final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        backgroundColor: Theme.of(context).primaryColorLight,
        elevation: 0,
      ),
      body: userProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 50.0, 24.0, 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Foto Profil Pengguna
                      CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                          /*user?.photoURL ??*/ 'https://www.w3schools.com/w3images/avatar2.png',
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        /*user?.displayName ??*/ 'Nama Tidak Tersedia',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        /*user?.email ??*/ 'Email Tidak Tersedia',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          // Arahkan ke halaman edit profil jika diperlukan
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Theme.of(
                            context,
                          ).secondaryHeaderColor,
                          padding: EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 40,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 5,
                        ),
                        child: Text('Edit Profil'),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
