import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: const Text(
        LocaleKeys.mainPage_orderHistoryScreen_name,
      ).tr(),
      body: const Wrapper(
        Center(
          child: Text('Order History screen'),
        ),
      ),
    );
  }
}
