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
      padding: const EdgeInsets.all(
        AppPadding.padding5,
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
          Radius.circular(
            AppBorderRadius.radius5,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  AppBorderRadius.radius5,
                ),
                child: Image.network(
                  cartItem.product.image,
                ),
              ),
              Positioned(
                top: AppSpacing.spacing5,
                right: AppSpacing.spacing5,
                child: Row(
                  children: <Widget>[
                    TransparentLabel(
                      height: AppSize.size28,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.padding5,
                      ),
                      child: Text(
                        '${cartItem.product.cost}\$',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSpacing.spacing5,
                    ),
                    if (cartItem.amount > 0)
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: onMinusTap,
                            child: TransparentLabel(
                              height: AppSize.size28,
                              width: AppSize.size28,
                              child: Icon(
                                Icons.remove_rounded,
                                color: theme.colorScheme.secondary,
                                size: AppSize.size28,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: AppSpacing.spacing5,
                          ),
                          TransparentLabel(
                            height: AppSize.size28,
                            width: AppSize.size28,
                            child: Text(
                              cartItem.amount.toString(),
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: AppSpacing.spacing5,
                          ),
                        ],
                      ),
                    GestureDetector(
                      onTap: onPlusTap,
                      child: TransparentLabel(
                        height: AppSize.size28,
                        width: AppSize.size28,
                        child: Icon(
                          Icons.add_rounded,
                          color: theme.colorScheme.secondary,
                          size: AppSize.size28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.padding5,
            ),
            child: Center(
              child: Text(
                cartItem.product.name.capitalizeEveryWord(),
                style: theme.textTheme.bodySmall,
                maxLines: AppMaxLines.max1,
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
