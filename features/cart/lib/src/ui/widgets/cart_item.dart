import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'price_label.dart';

class CartItem extends StatelessWidget {
  final CartItemModel cartItem;
  final VoidCallback onPlusTap;
  final VoidCallback onMinusTap;

  const CartItem({
    required this.cartItem,
    required this.onPlusTap,
    required this.onMinusTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
            top: AppPadding.padding7,
            right: AppPadding.padding5,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              left: AppPadding.padding6,
              top: AppPadding.padding6,
              right: AppPadding.padding12,
              bottom: AppPadding.padding6,
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
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppBorderRadius.radius5),
                  child: Image.network(
                    cartItem.product.image,
                    height: AppSize.size55,
                    width: AppSize.size75,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                const SizedBox(width: AppSpacing.spacing7),
                Expanded(
                  child: Text(
                    cartItem.product.name.capitalizeEveryWord(),
                    style: theme.textTheme.headlineSmall,
                    maxLines: AppMaxLines.max2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppSpacing.spacing7),
                Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: onMinusTap,
                      child: TransparentLabel(
                        child: Icon(
                          Icons.remove_rounded,
                          color: theme.colorScheme.secondary,
                          size: AppSize.size22,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spacing3),
                    TransparentLabel(
                      height: AppSize.size22,
                      width: AppSize.size22,
                      child: Text(
                        cartItem.amount.toString(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.spacing3),
                    GestureDetector(
                      onTap: onPlusTap,
                      child: TransparentLabel(
                        child: Icon(
                          Icons.add_rounded,
                          color: theme.colorScheme.secondary,
                          size: AppSize.size22,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: AppSpacing.spacing0,
          child: PriceLabel(cartItem.product.cost * cartItem.amount),
        ),
      ],
    );
  }
}
