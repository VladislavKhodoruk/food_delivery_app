import '../domain.dart';

class GetThemeModeUseCase implements FutureUseCase<NoParams, bool> {
  final SettingsRepository _settingsRepository;

  const GetThemeModeUseCase({
    required SettingsRepository settingsRepository,
  }) : _settingsRepository = settingsRepository;

  @override
  Future<bool> execute(NoParams input) async {
    return _settingsRepository.getThemeMode();
  }
}
