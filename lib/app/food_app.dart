import 'package:core/di/app_di.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';
import 'package:core/core.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Food Delivery Application',
      theme: AppTheme.lightTheme,
      routerDelegate: appLocator.get<AppRouter>().delegate(),
      routeInformationParser: appLocator.get<AppRouter>().defaultRouteParser(),
    );
  }
}
