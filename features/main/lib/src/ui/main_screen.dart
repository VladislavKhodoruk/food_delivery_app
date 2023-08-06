import 'package:cart/cart.gm.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home.gm.dart';
import 'package:order_history/order_history.gm.dart';
import 'package:settings/settings.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const <PageRouteInfo>[
        HomeRoute(),
        CartRoute(),
        SettingsRoute(),
        OrderHistoryRoute(),
      ],
      animationDuration: const Duration(microseconds: 0),
      bottomNavigationBuilder: (BuildContext context, TabsRouter router) {
        return BottomNavigationBar(
          currentIndex: router.activeIndex,
          onTap: (int index) => router.setActiveIndex(index),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'a'),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'b'),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'b'),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'b'),
          ],
        );
      },
    );
  }
}
