import 'package:core/extensions/extensions.dart';
import 'package:core/constants/app_text_constants.dart';
import 'package:core/typedefs/typedefs.dart';
import 'package:core_ui/core_ui.dart';
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
    final TextTheme textTheme = Theme.of(context).textTheme;

    return PopupMenuButton<String>(
      initialValue: selectedOption,
      onSelected: (String item) {
        onPressed(item);
      },
      color: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppColors.black,
      elevation: 5,
      icon: const Icon(Icons.menu_rounded, color: AppColors.red),
      itemBuilder: (BuildContext context) => getOptions()
          .map(
            (String item) => PopupMenuItem<String>(
              value: item,
              child: Text(
                item.isNotEmpty ? item.capitalize() : AppTextConstants.all,
                style: textTheme.bodyMedium,
              ),
            ),
          )
          .toList(),
    );
  }
}
