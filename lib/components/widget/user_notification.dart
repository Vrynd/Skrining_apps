import 'package:flutter/material.dart';

class UserNotification extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const UserNotification({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: onTap,
      child: Container(
        width: 50,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            size: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
