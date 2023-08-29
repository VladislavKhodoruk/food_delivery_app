import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  final VoidCallback onPlusTap;
  final VoidCallback onMinusTap;
  final int amount;

  const BottomButtons({
    required this.onPlusTap,
    required this.onMinusTap,
    required this.amount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    if (amount == 0) {
      return SizedBox(
        height: AppSize.size45,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPlusTap,
          child: Icon(
            Icons.add_rounded,
            size: AppSize.size30,
            color: theme.colorScheme.secondary,
          ),
        ),
      );
    } else {
      return SizedBox(
        height: AppSize.size45,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: SizedBox(
                height: double.infinity,
                child: ElevatedButton(
                  onPressed: onMinusTap,
                  child: Icon(
                    Icons.remove_rounded,
                    size: AppSize.size30,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: theme.scaffoldBackgroundColor.withOpacity(
                  AppOpacity.opacity0_7,
                ),
                child: Center(
                  child: Text(
                    amount.toString(),
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                height: double.infinity,
                child: ElevatedButton(
                  onPressed: onPlusTap,
                  child: Icon(
                    Icons.add_rounded,
                    size: AppSize.size30,
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
