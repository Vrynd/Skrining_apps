import 'package:flutter/material.dart';

class ChoiceCard extends StatelessWidget {
  final String title;
  final IconData? infoIcon;
  final List<String> options;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final List<Map<String, String>>? infoItems;

  const ChoiceCard({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    this.infoIcon = Icons.info_outline,
    this.infoItems,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              if (infoItems != null)
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Informasi',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleLarge,
                                  ),
                                  GestureDetector(
                                    onTap: () => Navigator.pop(context),
                                    child: const Icon(Icons.close_outlined),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Flexible(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: infoItems!.map((item) {
                                      return Container(
                                        margin: const EdgeInsets.only(
                                          bottom: 8,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primaryContainer,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: ListTile(
                                          dense: true,
                                          title: Text(
                                            item['title'] ?? '',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.titleMedium,
                                          ),
                                          subtitle: Padding(
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              item['subtitle'] ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    fontSize: 16,
                                                    color: Theme.of(
                                                      context,
                                                    ).colorScheme.outline,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    infoIcon,
                    size: 20,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
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
                        return Theme.of(context).colorScheme.primary;
                      }
                      return Theme.of(context).colorScheme.outlineVariant;
                    }),
                    title: Text(
                      options[i],
                      style: (options[i] == selectedValue)
                          ? Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                              fontWeight: FontWeight.w600,
                            )
                          : Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                    ),
                  ),
                  if (i != options.length - 1)
                    Divider(
                      height: 0,
                      thickness: 1.4,
                      color: Theme.of(context).colorScheme.surfaceContainerHigh,
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
