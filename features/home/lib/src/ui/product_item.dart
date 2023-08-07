import 'package:core/extensions/extensions.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:domain/domain.dart';

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
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: AppColors.shadowBlue,
              spreadRadius: 0,
              blurRadius: 8,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.all(
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
                      child: Text('${widget.productItem.cost}\$',
                          style: textTheme.bodyMedium
                              ?.copyWith(color: AppColors.white)),
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
                              child: const Icon(
                                Icons.remove_rounded,
                                color: AppColors.white,
                                size: 28.0,
                              ),
                            ),
                          ),
                          TransparentLabel(
                            margin: const EdgeInsets.only(right: 5),
                            height: 28,
                            width: 28,
                            child: Text(_count.toString(),
                                style: textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.white)),
                          ),
                        ],
                      ),
                    TransparentLabel(
                      height: 28,
                      width: 28,
                      child: GestureDetector(
                        onTap: _onPlusTap,
                        child: const Icon(
                          Icons.add_rounded,
                          color: AppColors.white,
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
                style: textTheme.bodyMedium,
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
