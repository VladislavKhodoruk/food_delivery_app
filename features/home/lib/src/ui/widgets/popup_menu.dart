import 'package:core/core.dart';
import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  final List<String> menuOptions;
  final StringCallback onPressed;
  final String selectedOption;

  const PopupMenu({
    super.key,
    required this.menuOptions,
    required this.onPressed,
    required this.selectedOption,
  });

  List<String> getOptions() {
    final List<String> newOptions = menuOptions;
    newOptions.sort();
    newOptions.insert(0, '');
    return newOptions.toSet().toList();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return PopupMenuButton<String>(
      initialValue: selectedOption,
      onSelected: (String item) {
        onPressed(item);
      },
      color: theme.colorScheme.secondaryContainer,
      surfaceTintColor: Colors.transparent,
      shadowColor: theme.colorScheme.tertiary,
      elevation: 5,
      icon: Icon(
        Icons.menu_rounded,
        color: theme.colorScheme.primary,
      ),
      itemBuilder: (BuildContext context) => getOptions()
          .map(
            (String item) => PopupMenuItem<String>(
              value: item,
              child: Text(
                item.isNotEmpty
                    ? item.capitalize()
                    : LocaleKeys.mainPage_homeScreen_allProductsMenuItem.tr(),
                style: theme.textTheme.bodySmall,
              ),
            ),
          )
          .toList(),
    );
  }
}
