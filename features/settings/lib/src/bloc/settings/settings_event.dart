part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class SwitchThemeEvent extends SettingsEvent {
  SwitchThemeEvent();
}
