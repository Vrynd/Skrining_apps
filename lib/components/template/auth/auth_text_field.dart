import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skrining_apps/provider/show_hide_password_provider.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool obscureText;
  final bool isPassword;
  final TextInputType keyboardType;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    required this.prefixIcon,
    this.obscureText = false,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Consumer<ShowHidePasswordProvider>(
          builder: (context, value, child) {
            final isObscure = isPassword ? value.showHide : obscureText;
            return TextField(
              controller: controller,
              maxLines: 1,
              style: const TextStyle(fontSize: 18),
              obscureText: isObscure,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  prefixIcon,
                  size: 24,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          isObscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 22,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                        onPressed: () {
                          value.showHide = !value.showHide;
                        },
                      )
                    : null,
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
                    color: Theme.of(context).colorScheme.outlineVariant,
                    width: 1.2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 1.4,
                  ),
                ),
                hintText: hint,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
