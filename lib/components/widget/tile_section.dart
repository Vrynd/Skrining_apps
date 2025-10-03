import 'package:flutter/material.dart';

class TileSection extends StatelessWidget {
  final List<Widget> children;

  const TileSection({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: _withDividers(context),
      ),
    );
  }

  List<Widget> _withDividers(BuildContext context) {
    final List<Widget> items = [];
    for (int i = 0; i < children.length; i++) {
      items.add(children[i]);
      if (i < children.length - 1) {
        items.add(
          Divider(
            height: 0,
            indent: 56,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        );
      }
    }
    return items;
  }
}
