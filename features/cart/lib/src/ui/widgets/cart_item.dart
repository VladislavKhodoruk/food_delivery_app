import 'package:cart/src/ui/widgets/price_label.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;

  const CartItem({
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: 7,
            right: 5,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              left: 6,
              top: 6,
              right: 12,
              bottom: 6,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.background,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 1,
                color: theme.colorScheme.tertiary,
              ),
            ),
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    cartItem.product.image,
                    height: 55,
                    width: 75,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(width: 7),
                Expanded(
                  child: Text(
                    cartItem.product.name.capitalizeEveryWord(),
                    style: theme.textTheme.headlineSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 7),
                Row(
                  children: <Widget>[
                    TransparentLabel(
                      child: Icon(
                        Icons.remove_rounded,
                        color: theme.colorScheme.secondary,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 3),
                    TransparentLabel(
                      height: 22,
                      width: 22,
                      child: Text(
                        cartItem.amount.toString(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 3),
                    TransparentLabel(
                      child: Icon(
                        Icons.add_rounded,
                        color: theme.colorScheme.secondary,
                        size: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: PriceLabel(cartItem.product.cost),
        ),
      ],
    );
  }
}
