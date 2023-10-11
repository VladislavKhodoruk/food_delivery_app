part of 'settings_bloc.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class InitEvent extends SettingsEvent {
  InitEvent();
}

class SwitchThemeEvent extends SettingsEvent {
  SwitchThemeEvent();
}
