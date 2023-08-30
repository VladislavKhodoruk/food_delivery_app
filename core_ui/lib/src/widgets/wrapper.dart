import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  final Widget child;

  const Wrapper(
    this.child, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.padding18),
      child: child,
    );
  }
}
