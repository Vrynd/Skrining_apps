import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? subtitleIcon;

  const SectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.subtitleIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 24,
          ),
        ),
        if (subtitle != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (subtitleIcon != null)
                  Icon(
                    subtitleIcon,
                    size: 15,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                if (subtitleIcon != null) const SizedBox(width: 4),
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
