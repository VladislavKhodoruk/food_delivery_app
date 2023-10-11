part of 'settings_bloc.dart';

class SettingsState {
  final bool isDark;

  const SettingsState({
    required this.isDark,
  });

  SettingsState.empty({
    this.isDark = false,
  });

  SettingsState copyWith({
    bool? isDark,
  }) {
    return SettingsState(
      isDark: isDark ?? this.isDark,
    );
  }
}
