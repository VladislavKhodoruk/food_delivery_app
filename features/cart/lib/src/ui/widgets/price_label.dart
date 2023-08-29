import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  final double price;

  const PriceLabel(
    this.price, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.padding5,
      ),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: theme.cardTheme.shadowColor!,
            spreadRadius: AppSpreadRadius.spread0,
            blurRadius: AppBlurRadius.radius8,
            offset: AppOffset.offset0_2, // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(AppBorderRadius.radius5),
        ),
        border: Border.all(
          color: theme.colorScheme.tertiary,
        ),
      ),
      child: Text(
        '${price.toString()}\$',
        style: theme.textTheme.bodyMedium
            ?.copyWith(color: theme.colorScheme.primary),
      ),
    );
  }
}
