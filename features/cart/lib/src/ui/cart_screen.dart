import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: const Text(
          LocaleKeys.mainPage_cartScreen_name,
        ).tr(),
      ),
      body: const Wrapper(
        Center(
          child: Text(
            'Cart screen',
          ),
        ),
      ),
    );
  }
}
