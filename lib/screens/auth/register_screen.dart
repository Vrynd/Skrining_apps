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
    if (email.isNotEmpty && password.isNotEmpty) {
      final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
      final navigator = Navigator.of(context);
      final scaffoldMessenger = ScaffoldMessenger.of(context);

      await firebaseAuthProvider.createAccount(email, password);
      switch (firebaseAuthProvider.authStatus) {
        case FirebaseAuthStatus.accountCreated:
          navigator.pop();
        case _:
          scaffoldMessenger.showSnackBar(
            SnackBar(content: Text(firebaseAuthProvider.message ?? "")),
          );
      }
    } else {
      const message = "Fill the email and password correctly";
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      scaffoldMessenger.showSnackBar(const SnackBar(content: Text(message)));
    }
  }

  void _goToLogin() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
