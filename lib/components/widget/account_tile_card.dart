import 'package:flutter/material.dart';

class AccountTileCard extends StatelessWidget {
  final IconData icon;
  final Color lightColor;
  final Color darkColor;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final bool isSwitch;
  final bool switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  const AccountTileCard({
    super.key,
    required this.icon,
    required this.lightColor,
    required this.darkColor,
    required this.title,
    this.onTap,
    this.trailing,
    this.isSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
  });

  Color _iconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light
        ? lightColor
        : darkColor;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: _iconColor(context), size: 26),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      trailing: isSwitch
          ? Switch.adaptive(
              value: switchValue,
              onChanged: onSwitchChanged,
              inactiveThumbColor:
                  Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade300
                  : Colors.grey.shade600,
              inactiveTrackColor:
                  Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade200
                  : Colors.grey.shade700,
            )
          : trailing ??
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
      onTap: isSwitch ? null : onTap,
    );
  }
}
