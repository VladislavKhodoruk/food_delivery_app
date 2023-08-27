import 'package:core/core.dart';
import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;

  const TextLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: theme.colorScheme.tertiary,
        ),
      ),
      child: Text(
        text.capitalize(),
        style: theme.textTheme.labelMedium,
      ),
    );
  }
}
