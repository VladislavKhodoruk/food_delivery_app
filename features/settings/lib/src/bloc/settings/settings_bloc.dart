import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetThemeModeUseCase _getThemeModeUseCase;
  final SetThemeModeUseCase _setThemeModeUseCase;

  SettingsBloc({
    required GetThemeModeUseCase getThemeModeUseCase,
    required SetThemeModeUseCase setThemeModeUseCase,
  })  : _getThemeModeUseCase = getThemeModeUseCase,
        _setThemeModeUseCase = setThemeModeUseCase,
        super(
          SettingsState.empty(),
        ) {
    on<SwitchThemeEvent>(_switchTheme);
    on<InitEvent>(_init);

    add(InitEvent());
  }

  Future<void> _init(
    InitEvent event,
    Emitter<SettingsState> emit,
  ) async {
    final bool isDark = await _getThemeModeUseCase.execute(const NoParams());

    emit(
      state.copyWith(
        isDark: isDark,
      ),
    );
  }

  Future<void> _switchTheme(
    SwitchThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _setThemeModeUseCase.execute(!state.isDark);

    emit(
      state.copyWith(
        isDark: !state.isDark,
      ),
    );
  }
}
