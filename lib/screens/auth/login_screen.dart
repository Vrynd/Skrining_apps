import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/components/template/auth/auth_button.dart';
import 'package:skrining_apps/components/template/auth/auth_card.dart';
import 'package:skrining_apps/components/template/auth/auth_hero.dart';
import 'package:skrining_apps/components/template/auth/auth_redirect.dart';
import 'package:skrining_apps/components/template/auth/auth_text_field.dart';
import 'package:skrining_apps/firebase_auth_status.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';
import 'package:skrining_apps/provider/shared_prefrences_provider.dart';
import 'package:skrining_apps/screens/routes/route_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);
    final isLogin = context.read<SharedPreferenceProvider>().isLogin;

    Future.microtask(() async {
      if (isLogin) {
        await firebaseAuthProvider.updateProfile();
        navigator.pushReplacementNamed(RouteScreen.home.name);
      }
    });
  }

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
                        title: 'Masuk',
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
                              prefixIcon: Icons.lock_outlined,
                              obscureText: true,
                              isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(height: 24),
                            Consumer<FirebaseAuthProvider>(
                              builder: (context, value, child) {
                                return switch (value.authStatus) {
                                  FirebaseAuthStatus.authenticating =>
                                    const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  _ => AuthButton(
                                    onPressed: _tapToLogin,
                                    textAction: 'Masuk',
                                  ),
                                };
                              },
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                child: Text(
                                  'Lupa Kata Sandi ?',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      AuthRedirect(
                        questionText: "Belum punya akun?",
                        actionText: "Daftar Disini",
                        onTap: _goToRegister,
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

  void _tapToLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    // Validasi email dan password harus diisi
    if (email.isEmpty || password.isEmpty) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text("Email dan kata sandi tidak boleh kosong"),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    // Validasi format email
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(email)) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text("Format email tidak valid"),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final sharedPreferenceProvider = context.read<SharedPreferenceProvider>();
    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final navigator = Navigator.of(context);

    await firebaseAuthProvider.signInUser(email, password);
    if (firebaseAuthProvider.authStatus == FirebaseAuthStatus.authenticated) {
      await sharedPreferenceProvider.login();
      navigator.pushReplacementNamed(RouteScreen.home.name);
    } else {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(firebaseAuthProvider.message ?? ""),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _goToRegister() async {
    Navigator.pushNamed(context, RouteScreen.register.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
