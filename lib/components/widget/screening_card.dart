import 'package:flutter/material.dart';

class ScreeningCard extends StatelessWidget {
  final String title;
  final String hint;
  final List<String>? options;
  final void Function(String?)? onChanged;

  const ScreeningCard({
    super.key,
    required this.title,
    required this.hint,
    this.options,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            if (options != null)
              DropdownButtonFormField<String>(
                icon: const Icon(Icons.expand_more),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 12,
                  ),
                ),
                hint: Text(
                  hint,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                items: options!
                    .map(
                      (opt) => DropdownMenuItem(value: opt, child: Text(opt)),
                    )
                    .toList(),
                onChanged: onChanged,
              )
            else
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceContainerLow,
                  hintText: hint,
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
