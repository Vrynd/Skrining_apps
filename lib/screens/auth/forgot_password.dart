import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/components/template/auth/auth_button.dart';
import 'package:skrining_apps/components/template/auth/auth_card.dart';
import 'package:skrining_apps/components/template/auth/auth_hero.dart';
import 'package:skrining_apps/components/template/auth/auth_redirect.dart';
import 'package:skrining_apps/components/template/auth/auth_text_field.dart';
import 'package:skrining_apps/components/widget/scaffold_widget.dart';
import 'package:skrining_apps/firebase_auth_status.dart';
import 'package:skrining_apps/provider/firebase_auth_provider.dart';
import 'package:skrining_apps/provider/shared_prefrences_provider.dart';
import 'package:skrining_apps/screens/routes/route_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();

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
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ScaffoldWigdet(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 22),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AuthHero(
                          title: 'Lupa Kata Sandi',
                          subtitle: 'Silakan masukkan email Anda untuk mereset',
                        ),
                        const SizedBox(height: 15),
                        AuthCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AutofillGroup(
                                child: AuthTextField(
                                  label: 'Email',
                                  hint: 'Masukkan email Anda',
                                  controller: _emailController,
                                  prefixIcon: Icons.email_outlined,
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: [AutofillHints.email],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Consumer<FirebaseAuthProvider>(
                                builder: (context, value, child) {
                                  final isLoading =
                                      value.authStatus ==
                                      FirebaseAuthStatus.ressetingPassword;
                                  return AuthButton(
                                    textAction: "Reset Kata Sandi",
                                    onPressed: _tapToReset,
                                    isLoading: isLoading,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        AuthRedirect(
                          questionText: "Ingat kata sandi?",
                          actionText: "Klik disini",
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
      ),
    );
  }

  void _tapToReset() async {
    final email = _emailController.text.trim();

    final firebaseAuthProvider = context.read<FirebaseAuthProvider>();
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

    if (email.isEmpty) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Masukkan email anda dengan benar",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
      return;
    }

    await firebaseAuthProvider.resetPassword(email);
    if (!mounted) return;
    if (firebaseAuthProvider.authStatus ==
        FirebaseAuthStatus.passwordResetEmailSent) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            firebaseAuthProvider.message ??
                "Cek email Anda untuk reset kata sandi",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );

      navigator.pop();
    } else if (firebaseAuthProvider.authStatus == FirebaseAuthStatus.error) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            firebaseAuthProvider.message ?? "Terjadi kesalahan",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }
  }

  void _goToLogin() async {
    Navigator.pushNamed(context, RouteScreen.login.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
