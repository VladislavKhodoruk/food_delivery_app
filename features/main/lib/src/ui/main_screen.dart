import 'package:cart/cart.gm.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home.gm.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';

import 'main_bottom_navigation_bar.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      routes: const [
        HomeRoute(),
        SettingsRoute(),
        OrderHistoryRoute(),
        CartRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: MainBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (int index) => tabsRouter.setActiveIndex(index),
          ),
        );
      },
    );
  }
}
