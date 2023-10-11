import 'package:domain/domain.dart';

import '../providers/local/settings_provider.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsProvider _settingsProvider;

  SettingsRepositoryImpl({
    required SettingsProvider settingsProvider,
  }) : _settingsProvider = settingsProvider;

  @override
  Future<bool> getThemeMode() async {
    return _settingsProvider.getThemeMode();
  }

  @override
  Future<void> setThemeMode(bool isDark) async {
    return _settingsProvider.setThemeMode(isDark);
  }
}
