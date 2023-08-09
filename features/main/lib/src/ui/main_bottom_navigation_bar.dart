import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:main/src/ui/cart_button.dart';

class MainBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const MainBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: theme.iconTheme.color,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_rounded,
            color: theme.iconTheme.color,
          ),
          activeIcon: Icon(
            Icons.home_rounded,
            color: theme.colorScheme.primary,
          ),
          label: LocaleKeys.mainPage_homeScreen_name.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings_rounded,
            color: theme.iconTheme.color,
          ),
          activeIcon: Icon(
            Icons.settings_rounded,
            color: theme.colorScheme.primary,
          ),
          label: LocaleKeys.mainPage_settingsScreen_name.tr(),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history_rounded,
            color: theme.iconTheme.color,
          ),
          activeIcon: Icon(
            Icons.history_rounded,
            color: theme.colorScheme.primary,
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
