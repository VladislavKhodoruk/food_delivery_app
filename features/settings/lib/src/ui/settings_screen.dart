import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/settings/settings_bloc.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final SettingsBloc bloc = context.read<SettingsBloc>();

    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (_, SettingsState state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 65,
            title: const Text(
              LocaleKeys.mainPage_settingsScreen_name,
            ).tr(),
          ),
          body: Wrapper(
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      LocaleKeys.mainPage_settingsScreen_theme.tr(),
                      style: theme.textTheme.bodyLarge,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          LocaleKeys.mainPage_settingsScreen_lightTheme.tr(),
                          style: theme.textTheme.bodyLarge,
                        ),
                        const SizedBox(width: 10),
                        Switch(
                          value: state.darkMode,
                          onChanged: (_) => bloc.add(SwitchThemeEvent()),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          LocaleKeys.mainPage_settingsScreen_darkTheme.tr(),
                          style: theme.textTheme.bodyLarge,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      LocaleKeys.mainPage_settingsScreen_language.tr(),
                      style: theme.textTheme.bodyLarge,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          LanguageCode.en.name.toUpperCase(),
                          style: theme.textTheme.bodyLarge,
                        ),
                        Radio(
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          value: LanguageLocale.en_US.name,
                          groupValue: context.locale.toString(),
                          onChanged: (value) {
                            context.setLocale(
                              Locale(
                                LanguageCode.en.name,
                                CountryCode.US.name,
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 16),
                        Text(
                          LanguageCode.be.name.toUpperCase(),
                          style: theme.textTheme.bodyLarge,
                        ),
                        Radio(
                          visualDensity: const VisualDensity(
                            horizontal: VisualDensity.minimumDensity,
                            vertical: VisualDensity.minimumDensity,
                          ),
                          value: LanguageLocale.be_BY.name,
                          groupValue: context.locale.toString(),
                          onChanged: (value) {
                            context.setLocale(
                              Locale(
                                LanguageCode.be.name,
                                CountryCode.BY.name,
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
