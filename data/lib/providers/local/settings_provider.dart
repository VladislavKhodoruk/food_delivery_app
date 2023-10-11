import 'package:core/constants/local_constants.dart';
import 'package:hive/hive.dart';

const String theme = 'theme';

class SettingsProvider {
  SettingsProvider();

  late final Box _settingsBox;

  Future<void> openBoxes() async {
    _settingsBox = await Hive.openBox(LocalConstants.settingsBox);
  }

  Future<bool> getThemeMode() async {
    return _settingsBox.get('isDark').toString() == 'true' ? true : false;
  }

  Future<void> setThemeMode(bool isDark) async {
    _settingsBox.put('isDark', isDark.toString());
  }
}
