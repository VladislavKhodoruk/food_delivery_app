import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
export 'app_colors.dart';
export 'app_text.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.red,
      ),
      scaffoldBackgroundColor: AppColors.white,
      bottomNavigationBarTheme:
          const BottomNavigationBarThemeData(backgroundColor: AppColors.white),
      useMaterial3: true,
      primaryColor: AppColors.red,
      dividerColor: AppColors.red,
      appBarTheme: AppBarTheme(
          toolbarHeight: 65,
          surfaceTintColor: Colors.transparent,
          titleTextStyle: AppText.cabin24Bold.copyWith(color: AppColors.red),
          centerTitle: true,
          shadowColor: AppColors.shadowGrayDark,
          elevation: 3,
          backgroundColor: AppColors.white),
      textTheme: TextTheme(
          headlineLarge: AppText.cabin24Bold.copyWith(color: AppColors.red),
          headlineMedium:
              AppText.cabin20Regular.copyWith(color: AppColors.white),
          labelLarge: AppText.cabin16Regular.copyWith(color: AppColors.black),
          labelMedium: AppText.cabin14Bold,
          labelSmall: AppText.cabin10SemiBold.copyWith(color: AppColors.red),
          bodyLarge: AppText.cabin18Regular.copyWith(color: AppColors.black),
          bodyMedium: AppText.cabin14SemiBold.copyWith(color: AppColors.black)),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }
}
