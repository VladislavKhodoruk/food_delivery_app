import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  final bool isActive;

  const CartButton({
    super.key,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: isActive ? theme.colorScheme.primary : theme.iconTheme.color,
          ),
        ),
        Positioned(
          left: 57,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: theme.colorScheme.secondaryContainer,
              border: Border.all(
                color: theme.iconTheme.color as Color,
              ),
            ),
            child: Text(
              '20.75\$',
              style: theme.textTheme.labelSmall,
            ),
          ),
        )
      ],
    );
  }
}
