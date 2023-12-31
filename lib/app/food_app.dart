import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (BuildContext context) => SettingsBloc(
        setThemeModeUseCase: appLocator.get<SetThemeModeUseCase>(),
        getThemeModeUseCase: appLocator.get<GetThemeModeUseCase>(),
      ),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (
          BuildContext context,
          SettingsState state,
        ) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            title: 'Flutter Food Delivery Application',
            theme: state.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
            routerDelegate: appLocator.get<AppRouter>().delegate(),
            routeInformationParser: appLocator.get<AppRouter>().defaultRouteParser(),
          );
        },
      ),
    );
  }
}
