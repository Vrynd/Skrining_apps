import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/components/template/auth/auth_button.dart';
import 'package:skrining_apps/components/template/auth/auth_card.dart';
import 'package:skrining_apps/components/template/auth/auth_hero.dart';
import 'package:skrining_apps/components/template/auth/auth_redirect.dart';
import 'package:skrining_apps/components/template/auth/auth_text_field.dart';
import 'package:skrining_apps/firebase_auth_status.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 22),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AuthHero(
                        title: 'Buat Akun',
                        subtitle: 'Silakan masukkan data akun Anda',
                      ),
                      const SizedBox(height: 15),
                      AuthCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AuthTextField(
                              label: 'Nama Lengkap',
                              hint: 'Masukkan nama lengkap Anda',
                              controller: _fullnameController,
                              prefixIcon: Icons.person_outline,
                              keyboardType: TextInputType.name,
                            ),
                            const SizedBox(height: 20),
                            AuthTextField(
                              label: 'Email',
                              hint: 'Masukkan email Anda',
                              controller: _emailController,
                              prefixIcon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 20),
                            AuthTextField(
                              label: 'Kata Sandi',
                              hint: 'Masukkan kata sandi Anda',
                              controller: _passwordController,
                              prefixIcon: Icons.lock_outline,
                              obscureText: true,
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(height: 24),
                            Consumer<FirebaseAuthProvider>(
                              builder: (context, value, child) {
                                return switch (value.authStatus) {
                                  FirebaseAuthStatus.creatingAccount =>
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  _ => AuthButton(
                                    onPressed: _tapToRegister,
                                    textAction: 'Daftar',
                                  ),
                                };
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      AuthRedirect(
                        questionText: 'Sudah punya akun?',
                        actionText: 'Masuk',
                        onTap: _goToLogin,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _tapToRegister() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final fullname = _fullnameController.text.trim();
    final scaffoldMessenger2 = ScaffoldMessenger.of(context);

    // Validasi nama, email dan password harus diisi
    if (email.isEmpty || password.isEmpty || fullname.isEmpty) {
      scaffoldMessenger2.showSnackBar(
        const SnackBar(
          content: Text("Nama, email, dan kata sandi tidak boleh kosong"),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    // Validasi format email
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(email)) {
      scaffoldMessenger2.showSnackBar(
        const SnackBar(
          content: Text("Format email tidak valid"),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);

    await firebaseAuthProvider.createAccount(fullname, email, password);
    if (firebaseAuthProvider.authStatus ==
        FirebaseAuthStatus.accountCreated) {
      navigator.pop();
    } else {
      scaffoldMessenger2.showSnackBar(
        SnackBar(
          content: Text(firebaseAuthProvider.message ?? ""),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _goToLogin() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fullnameController.dispose();
    super.dispose();
  }
}
