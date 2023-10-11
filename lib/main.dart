import 'package:core/core.dart';
import 'package:data/di/data_di.dart';
import 'package:data/providers/local/hive_provider.dart';
import 'package:data/providers/local/settings_provider.dart';
import 'package:flutter/material.dart';

import 'app/food_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appDI.initDependencies();
  dataDI.initDependencies();
  await appLocator.allReady();
  await appLocator<HiveProvider>().openBoxes();
  await appLocator<SettingsProvider>().openBoxes();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('be', 'BY'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const FoodApp(),
    ),
  );
}
