import 'package:flutter/material.dart';
import 'package:skrining_apps/components/template/auth/auth_hero.dart';
import 'package:skrining_apps/components/template/auth/auth_redirect.dart';
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
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 22,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(
                                context,
                              ).colorScheme.shadow.withValues(alpha: .2),
                              blurRadius: 2,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Email
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 18),
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.email_outlined,
                                      size: 24,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.tertiary,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 10,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.outlineVariant,
                                        width: 1.2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        width: 1.4,
                                      ),
                                    ),
                                    hintText: 'Masukkan email Anda',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            // Password
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kata Sandi',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onSurface,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 18),
                                  controller: _passwordController,
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock_outline,
                                      size: 24,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.tertiary,
                                    ),
                                    suffixIcon: Icon(
                                      Icons.visibility_off_outlined,
                                      size: 22,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.outlineVariant,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 10,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.outlineVariant,
                                        width: 1.2,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        width: 1.4,
                                      ),
                                    ),
                                    hintText: 'Masukkan kata sandi Anda',
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            // Button
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF1565C0),
                                      Color(0xFF42A5F5),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'Masuk',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.surface,
                                      ),
                                ),
                              ),
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
                        onTap: _goToSignUp,
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

  void _goToSignUp() {
    Navigator.pushNamed(context, RouteScreen.register.name);
  }
}
