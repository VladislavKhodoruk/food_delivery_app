import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

export 'app_colors.dart';
export 'app_text.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.smoulderingRed,
        secondary: AppColors.white,
        secondaryContainer: AppColors.white,
        tertiary: AppColors.costumeBlue.withOpacity(0.5),
        background: AppColors.white,
        surfaceTint: AppColors.knightArmor.withOpacity(0.7),
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
          0.3,
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 65,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppText.cabin24Bold.copyWith(
          color: AppColors.smoulderingRed,
        ),
        centerTitle: true,
        shadowColor: AppColors.knightArmor.withOpacity(
          0.3,
        ),
        elevation: 3,
        backgroundColor: AppColors.white,
      ),
      textTheme: TextTheme(
        headlineLarge: AppText.cabin24Bold.copyWith(
          color: AppColors.smoulderingRed,
        ),
        labelLarge:
            AppText.cabin24Regular.copyWith(color: AppColors.smoulderingRed),
        headlineMedium: AppText.cabin20Regular.copyWith(
          color: AppColors.white,
        ),
        labelMedium: AppText.cabin14Regular.copyWith(
          color: AppColors.shoeWax,
        ),
        labelSmall: AppText.cabin10SemiBold.copyWith(
          color: AppColors.smoulderingRed,
        ),
        bodyLarge: AppText.cabin14Regular.copyWith(
          color: AppColors.shoeWax,
        ),
        bodyMedium: AppText.cabin14SemiBold.copyWith(
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
            0.25,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.smoulderingRed,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
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
          0.7,
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
      cardTheme: CardTheme(
        color: AppColors.blackLacquer,
        shadowColor: AppColors.eerieBlack.withOpacity(
          1,
        ),
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 65,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: AppText.cabin24Bold.copyWith(color: AppColors.heatWave),
        centerTitle: true,
        shadowColor: AppColors.eerieBlack,
        elevation: 3,
        backgroundColor: AppColors.eerieBlack,
      ),
      textTheme: TextTheme(
        headlineLarge: AppText.cabin24Bold.copyWith(
          color: AppColors.heatWave,
        ),
        headlineMedium: AppText.cabin20Regular.copyWith(
          color: AppColors.eerieBlack,
        ),
        labelLarge: AppText.cabin24Regular.copyWith(color: AppColors.heatWave),
        labelMedium: AppText.cabin14Regular.copyWith(
          color: AppColors.christmasSilver,
        ),
        labelSmall: AppText.cabin10SemiBold.copyWith(
          color: AppColors.heatWave,
        ),
        bodyLarge: AppText.cabin14Regular.copyWith(
          color: AppColors.white,
        ),
        bodyMedium: AppText.cabin14SemiBold.copyWith(
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
            borderRadius: BorderRadius.circular(5),
          ),
          splashFactory: InkRipple.splashFactory,
        ),
      ),
    );
  }
}
