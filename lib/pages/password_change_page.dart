// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/provider/password_change_provider.dart';

class PasswordChangePage extends StatelessWidget {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  PasswordChangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ganti Password'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: ChangeNotifierProvider(
        create: (context) => PasswordChangeProvider(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Consumer<PasswordChangeProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Text(
                    //   "Ganti Password Anda",
                    //   style: TextStyle(
                    //     fontSize: 24,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black87,
                    //   ),
                    // ),
                    SizedBox(height: 30),
                    _buildTextField(
                      controller: _oldPasswordController,
                      label: 'Password Lama',
                      obscureText: true,
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: _newPasswordController,
                      label: 'Password Baru',
                      obscureText: true,
                    ),
                    SizedBox(height: 32),
                    // Show loading indicator or error message
                    if (provider.isLoading)
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                      ),
                    if (provider.errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          provider.errorMessage!,
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        final oldPassword = _oldPasswordController.text;
                        final newPassword = _newPasswordController.text;
                        provider.changePassword(
                          oldPassword: oldPassword,
                          newPassword: newPassword,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: Text('Ganti Password'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}