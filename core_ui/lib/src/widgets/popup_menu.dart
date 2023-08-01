import 'package:core/extensions/extensions.dart';
import 'package:core/constants/app_text_constants.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

typedef StringCallback = void Function(String val);

class PopupMenu extends StatefulWidget {
  final List<String> menuOptions;
  final StringCallback onPressed;

  const PopupMenu(
      {super.key, required this.menuOptions, required this.onPressed});

  List<String> getOptions() {
    List<String> newOptions = menuOptions;
    newOptions.sort();
    newOptions.insert(0, '');
    return newOptions.toSet().toList();
  }

  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return PopupMenuButton<String>(
      initialValue: selectedOption,
      onSelected: (String item) {
        setState(() {
          selectedOption = item;
        });
        widget.onPressed(item);
      },
      color: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppColors.black,
      elevation: 5,
      icon: const Icon(Icons.menu_rounded, color: AppColors.red),
      itemBuilder: (BuildContext context) => widget
          .getOptions()
          .map((String item) => PopupMenuItem<String>(
                value: item,
                child: Text(
                  item.isNotEmpty ? item.capitalize() : AppTextConstants.all,
                  style: textTheme.bodyMedium,
                ),
              ))
          .toList(),
    );
  }
}
