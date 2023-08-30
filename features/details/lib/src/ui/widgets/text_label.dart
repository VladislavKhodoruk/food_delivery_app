import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;

  const TextLabel(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.padding2,
        horizontal: AppPadding.padding10,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: BorderRadius.circular(
          AppBorderRadius.radius5,
        ),
        border: Border.all(
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
