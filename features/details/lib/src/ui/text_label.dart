import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;

  const TextLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: AppColors.blue,
        ),
      ),
      child: Text(
        text.capitalize(),
        style: textTheme.labelLarge,
      ),
    );
  }
}
