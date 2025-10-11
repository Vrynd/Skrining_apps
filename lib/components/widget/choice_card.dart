import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  final String title;
  final IconData? infoIcon;
  final String? infoText;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const ChoiceCard({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.infoIcon = Icons.info_outline,
    this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    color: colorScheme.outline,
                  ),
                ),
              ),
              SizedBox(width: 4),
              if (infoIcon != null)
                Icon(infoIcon, size: 20, color: colorScheme.secondary),
            ],
          ),
          const SizedBox(height: 12),

          Container(
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: colorScheme.surfaceContainerHigh,
                width: 1.5,
              ),
            ),
            child: Column(
              children: [
                for (int i = 0; i < options.length; i++) ...[
                  RadioListTile<String>(
                    value: options[i],
                    groupValue: selectedValue,
                    onChanged: onChanged,
                    dense: true,
                    visualDensity: const VisualDensity(horizontal: -4),
                    contentPadding: EdgeInsets.zero,
                    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                      if (states.contains(WidgetState.selected)) {
                        return colorScheme.primary;
                      }
                      return colorScheme.outlineVariant;
                    }),
                    title: Text(
                      options[i],
                      style: (options[i] == selectedValue)
                          ? textTheme.titleMedium?.copyWith(
                              color: colorScheme.outline,
                              fontWeight: FontWeight.w600,
                            )
                          : textTheme.bodyLarge?.copyWith(
                              color: colorScheme.outline,
                            ),
                    ),
                  ),
                  if (i != options.length - 1)
                    Divider(
                      height: 0,
                      thickness: 1.4,
                      color: colorScheme.surfaceContainerHigh,
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
