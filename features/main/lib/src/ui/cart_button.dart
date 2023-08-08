import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CartButton extends StatelessWidget {
  bool? isActive;

  CartButton({super.key, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Stack(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: isActive == true ? AppColors.red : AppColors.gray,
          ),
        ),
        Positioned(
          left: 57,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 2,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: AppColors.white,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: AppColors.shadowGrayLight,
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
              border: Border.all(
                color: AppColors.gray,
              ),
            ),
            child: Text(
              '20.75\$',
              style: textTheme.labelSmall,
            ),
          ),
        )
      ],
    );
  }
}
