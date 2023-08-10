import 'package:core/extensions/extensions.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final ProductModel productItem;
  final VoidCallback? onPressed;

  const ProductItem({
    required this.productItem,
    this.onPressed,
    super.key,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int _count = 0;

  void _onPlusTap() {
    setState(() {
      _count += 1;
    });
  }

  void _onMinusTap() {
    setState(() {
      _count -= 1;
    });
  }

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
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  widget.productItem.image,
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
                      margin: const EdgeInsets.only(right: 5),
                      child: Text(
                        '${widget.productItem.cost}\$',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.secondary,
                        ),
                      ),
                    ),
                    if (_count > 0)
                      Row(
                        children: <Widget>[
                          TransparentLabel(
                            height: 28,
                            width: 28,
                            margin: const EdgeInsets.only(right: 5),
                            child: GestureDetector(
                              onTap: _onMinusTap,
                              child: Icon(
                                Icons.remove_rounded,
                                color: theme.colorScheme.secondary,
                                size: 28.0,
                              ),
                            ),
                          ),
                          TransparentLabel(
                            margin: const EdgeInsets.only(right: 5),
                            height: 28,
                            width: 28,
                            child: Text(
                              _count.toString(),
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    TransparentLabel(
                      height: 28,
                      width: 28,
                      child: GestureDetector(
                        onTap: _onPlusTap,
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
                widget.productItem.name.capitalizeEveryWord(),
                style: theme.textTheme.bodyMedium,
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
