import 'package:flutter/material.dart';

import '../../core_ui.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;

  const AppScaffold({
    required this.body,
    required this.title,
    this.leading,
    this.actions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppSize.size65,
        title: title,
        leading: leading,
        actions: actions,
      ),
      body: body,
    );
  }
}
