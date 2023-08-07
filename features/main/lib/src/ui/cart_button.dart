import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class CartButton extends StatelessWidget {
  bool? isActive;

  CartButton({super.key, this.isActive = false});

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
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.shopping_bag_outlined,
            color: isActive == true ? AppColors.red : null,
          ),
          const SizedBox(
            width: 10,
          ),
          Text('20\$', style: textTheme.bodyMedium)
        ],
      ),
    );
  }
}
