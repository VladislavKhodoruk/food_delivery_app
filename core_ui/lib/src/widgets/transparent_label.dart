import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TransparentLabel extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const TransparentLabel(
      {super.key,
      required this.child,
      this.padding,
      this.margin,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: AppColors.grayTransparent,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Center(child: child),
    );
  }
}
