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
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: theme.cardTheme.shadowColor!,
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          width: 1,
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
