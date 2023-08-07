import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/src/ui/cart_button.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const MainBottomNavigationBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_rounded),
          label: LocaleKeys.mainPage_bottomNavigationBar_home.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings_rounded),
          label: LocaleKeys.mainPage_bottomNavigationBar_settings.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.history_rounded),
          label: LocaleKeys.mainPage_bottomNavigationBar_orderHistory.tr(),
        ),
        BottomNavigationBarItem(
          icon: CartButton(),
          activeIcon: CartButton(
            isActive: true,
          ),
          label: LocaleKeys.mainPage_bottomNavigationBar_cart.tr(),
        ),
      ],
    );
  }
}
