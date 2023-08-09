import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

export 'app_colors.dart';
export 'app_text.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.red,
        secondary: AppColors.white,
        secondaryContainer: AppColors.white,
        tertiary: AppColors.blue.withOpacity(0.5),
        background: AppColors.white,
        surfaceTint: AppColors.gray.withOpacity(0.7),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.gray,
      ),
      scaffoldBackgroundColor: AppColors.blueLight,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
      ),
      useMaterial3: true,
      primaryColor: AppColors.red,
      dividerColor: AppColors.red,
      cardTheme: CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.blue.withOpacity(
          0.3,
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 65,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppText.cabin24Bold.copyWith(
          color: AppColors.red,
        ),
        centerTitle: true,
        shadowColor: AppColors.gray.withOpacity(
          0.3,
        ),
        elevation: 3,
        backgroundColor: AppColors.white,
      ),
      textTheme: TextTheme(
        headlineLarge: AppText.cabin24Bold.copyWith(
          color: AppColors.red,
        ),
        headlineMedium: AppText.cabin20Regular.copyWith(
          color: AppColors.white,
        ),
        labelLarge: AppText.cabin16Regular.copyWith(
          color: AppColors.blackLight,
        ),
        labelMedium: AppText.cabin14Bold,
        labelSmall: AppText.cabin10SemiBold.copyWith(
          color: AppColors.red,
        ),
        bodyLarge: AppText.cabin18Regular.copyWith(
          color: AppColors.blackLight,
        ),
        bodyMedium: AppText.cabin14SemiBold.copyWith(
          color: AppColors.blackLight,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(
          AppColors.red,
        ),
        trackColor: MaterialStateProperty.all(
          AppColors.white,
        ),
        trackOutlineColor: MaterialStateProperty.all(
          AppColors.blue.withOpacity(
            0.25,
          ),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.orange,
        secondary: AppColors.white,
        secondaryContainer: AppColors.black,
        tertiary: AppColors.black,
        background: AppColors.grayDark,
        surfaceTint: AppColors.gray.withOpacity(
          0.7,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.gray,
      ),
      scaffoldBackgroundColor: AppColors.blackLight,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.black,
      ),
      useMaterial3: true,
      primaryColor: AppColors.orange,
      dividerColor: AppColors.orange,
      cardTheme: CardTheme(
        color: AppColors.grayDark,
        shadowColor: AppColors.black.withOpacity(
          1,
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 65,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppText.cabin24Bold.copyWith(color: AppColors.orange),
        centerTitle: true,
        shadowColor: AppColors.black,
        elevation: 3,
        backgroundColor: AppColors.black,
      ),
      textTheme: TextTheme(
        headlineLarge: AppText.cabin24Bold.copyWith(
          color: AppColors.orange,
        ),
        headlineMedium: AppText.cabin20Regular.copyWith(
          color: AppColors.black,
        ),
        labelLarge: AppText.cabin16Regular.copyWith(
          color: AppColors.grayLight,
        ),
        labelMedium: AppText.cabin14Bold,
        labelSmall: AppText.cabin10SemiBold.copyWith(
          color: AppColors.orange,
        ),
        bodyLarge: AppText.cabin18Regular.copyWith(
          color: AppColors.white,
        ),
        bodyMedium: AppText.cabin14SemiBold.copyWith(
          color: AppColors.white,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(
          AppColors.orange,
        ),
        trackColor: MaterialStateProperty.all(
          AppColors.grayDark,
        ),
        trackOutlineColor: MaterialStateProperty.all(
          AppColors.black,
        ),
      ),
    );
  }
}
