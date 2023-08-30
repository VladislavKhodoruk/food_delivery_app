import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

export 'app_colors.dart';
export 'app_constants.dart';
export 'app_text.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.smoulderingRed,
        secondary: AppColors.white,
        secondaryContainer: AppColors.white,
        tertiary: AppColors.costumeBlue.withOpacity(AppOpacity.opacity0_5),
        background: AppColors.white,
        surfaceTint: AppColors.knightArmor.withOpacity(AppOpacity.opacity0_7),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.knightArmor,
      ),
      scaffoldBackgroundColor: AppColors.aircraftWhite,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
      ),
      useMaterial3: true,
      primaryColor: AppColors.smoulderingRed,
      dividerColor: AppColors.smoulderingRed,
      cardTheme: CardTheme(
        color: AppColors.white,
        shadowColor: AppColors.costumeBlue.withOpacity(
          AppOpacity.opacity0_3,
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: AppSize.size65,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppText.cabin24Bold.copyWith(
          color: AppColors.smoulderingRed,
        ),
        centerTitle: true,
        shadowColor: AppColors.knightArmor.withOpacity(
          AppOpacity.opacity0_3,
        ),
        elevation: AppElevation.elevation3,
        backgroundColor: AppColors.white,
      ),
      textTheme: TextTheme(
        headlineLarge: AppText.cabin24Bold.copyWith(
          color: AppColors.smoulderingRed,
        ),
        headlineMedium: AppText.cabin20Regular.copyWith(
          color: AppColors.white,
        ),
        headlineSmall: AppText.cabin18Regular.copyWith(
          color: AppColors.shoeWax,
        ),
        labelLarge: AppText.cabin24Regular.copyWith(
          color: AppColors.smoulderingRed,
        ),
        labelMedium: AppText.cabin14Regular.copyWith(
          color: AppColors.shoeWax,
        ),
        labelSmall: AppText.cabin10SemiBold.copyWith(
          color: AppColors.smoulderingRed,
        ),
        bodyMedium: AppText.cabin14Regular.copyWith(
          color: AppColors.shoeWax,
        ),
        bodySmall: AppText.cabin14SemiBold.copyWith(
          color: AppColors.shoeWax,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(
          AppColors.smoulderingRed,
        ),
        trackColor: MaterialStateProperty.all(
          AppColors.white,
        ),
        trackOutlineColor: MaterialStateProperty.all(
          AppColors.costumeBlue.withOpacity(
            AppOpacity.opacity0_25,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.smoulderingRed,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppBorderRadius.radius5,
            ),
          ),
          splashFactory: InkRipple.splashFactory,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.heatWave,
        secondary: AppColors.white,
        secondaryContainer: AppColors.eerieBlack,
        tertiary: AppColors.eerieBlack,
        background: AppColors.blackLacquer,
        surfaceTint: AppColors.knightArmor.withOpacity(
          AppOpacity.opacity0_7,
        ),
      ),
      iconTheme: const IconThemeData(
        color: AppColors.knightArmor,
      ),
      scaffoldBackgroundColor: AppColors.shoeWax,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.eerieBlack,
      ),
      useMaterial3: true,
      primaryColor: AppColors.heatWave,
      dividerColor: AppColors.heatWave,
      cardTheme: const CardTheme(
        color: AppColors.blackLacquer,
        shadowColor: AppColors.eerieBlack,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: AppSize.size65,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppText.cabin24Bold.copyWith(color: AppColors.heatWave),
        centerTitle: true,
        shadowColor: AppColors.eerieBlack,
        elevation: AppElevation.elevation3,
        backgroundColor: AppColors.eerieBlack,
      ),
      textTheme: TextTheme(
        headlineLarge: AppText.cabin24Bold.copyWith(
          color: AppColors.heatWave,
        ),
        headlineMedium: AppText.cabin20Regular.copyWith(
          color: AppColors.eerieBlack,
        ),
        headlineSmall: AppText.cabin18Regular.copyWith(
          color: AppColors.christmasSilver,
        ),
        labelLarge: AppText.cabin24Regular.copyWith(
          color: AppColors.heatWave,
        ),
        labelMedium: AppText.cabin14Regular.copyWith(
          color: AppColors.christmasSilver,
        ),
        labelSmall: AppText.cabin10SemiBold.copyWith(
          color: AppColors.heatWave,
        ),
        bodyMedium: AppText.cabin14Regular.copyWith(
          color: AppColors.white,
        ),
        bodySmall: AppText.cabin14SemiBold.copyWith(
          color: AppColors.white,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(
          AppColors.heatWave,
        ),
        trackColor: MaterialStateProperty.all(
          AppColors.blackLacquer,
        ),
        trackOutlineColor: MaterialStateProperty.all(
          AppColors.eerieBlack,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.heatWave,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppBorderRadius.radius5,
            ),
          ),
          splashFactory: InkRipple.splashFactory,
        ),
      ),
    );
  }
}
