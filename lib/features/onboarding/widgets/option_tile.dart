import 'package:animated_emoji/animated_emoji.dart';
import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final String title;
  final AnimatedEmojiData emoji;
  final bool isSelected;
  final VoidCallback? onTap;
  final bool isMultiSelect;

  const OptionTile.single({
    super.key,
    required this.title,
    required this.emoji,
    this.isSelected = false,
    this.onTap,
  }) : isMultiSelect = false;

  const OptionTile.multiple({
    super.key,
    required this.title,
    required this.emoji,
    this.isSelected = false,
    this.onTap,
  }) : isMultiSelect = true;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 1.5,
          color: isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).dividerColor,
        ),
      ),
      tileColor: Theme.of(context).dividerColor.withOpacity(0.2),
      leading: AnimatedEmoji(
        emoji,
        size: 40,
      ),
      title: Text(title),
      trailing: isMultiSelect
          ? isSelected
              ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary)
              : null
          : null,
    );
  }
}
