part of 'settings_bloc.dart';

class SettingsState {
  final bool darkMode;

  const SettingsState({
    required this.darkMode,
  });

  SettingsState.empty({
    this.darkMode = false,
  });

  SettingsState copyWith({
    bool? darkMode,
  }) {
    return SettingsState(
      darkMode: darkMode ?? this.darkMode,
    );
  }
}
