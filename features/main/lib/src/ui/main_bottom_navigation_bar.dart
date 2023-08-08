import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
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
          icon: const Icon(
            Icons.home_rounded,
            color: AppColors.gray,
          ),
          activeIcon: const Icon(
            Icons.home_rounded,
            color: AppColors.red,
          ),
          label: LocaleKeys.mainPage_homeScreen_name.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.settings_rounded,
            color: AppColors.gray,
          ),
          activeIcon: const Icon(Icons.settings_rounded, color: AppColors.red),
          label: LocaleKeys.mainPage_settingsScreen_name.tr(),
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.history_rounded,
            color: AppColors.gray,
          ),
          activeIcon: const Icon(
            Icons.history_rounded,
            color: AppColors.red,
          ),
          label: LocaleKeys.mainPage_orderHistoryScreen_name.tr(),
        ),
        BottomNavigationBarItem(
          icon: CartButton(),
          activeIcon: CartButton(
            isActive: true,
          ),
          label: LocaleKeys.mainPage_cartScreen_name.tr(),
        ),
      ],
    );
  }
}
