import 'package:flutter/material.dart';

class ClickButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textAction;
  final bool isLoading;

  const ClickButton({
    super.key,
    required this.onPressed,
    required this.textAction,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(
            colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                    height: 26,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Theme.of(context).colorScheme.surface,
                ),
              )
            : Text(
                textAction,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.surface,
                ),
              ),
      ),
    );
  }
}
