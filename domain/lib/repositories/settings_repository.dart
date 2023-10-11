abstract class SettingsRepository {
  Future<bool> getThemeMode();

  Future<void> setThemeMode(bool isDark);
}
