import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final CartItemModel cartItem;
  final VoidCallback onPlusTap;
  final VoidCallback onMinusTap;

  const ProductItem({
    required this.cartItem,
    required this.onPlusTap,
    required this.onMinusTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(5),
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
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  cartItem.product.image,
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Row(
                  children: <Widget>[
                    TransparentLabel(
                      height: 28,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '${cartItem.product.cost}\$',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    if (cartItem.amount > 0)
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: onMinusTap,
                            child: TransparentLabel(
                              height: 28,
                              width: 28,
                              child: Icon(
                                Icons.remove_rounded,
                                color: theme.colorScheme.secondary,
                                size: 28.0,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          TransparentLabel(
                            height: 28,
                            width: 28,
                            child: Text(
                              cartItem.amount.toString(),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                        ],
                      ),
                    GestureDetector(
                      onTap: onPlusTap,
                      child: TransparentLabel(
                        height: 28,
                        width: 28,
                        child: Icon(
                          Icons.add_rounded,
                          color: theme.colorScheme.secondary,
                          size: 28.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Center(
              child: Text(
                cartItem.product.name.capitalizeEveryWord(),
                style: theme.textTheme.bodySmall,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
