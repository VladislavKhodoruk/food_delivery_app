import 'package:core/core.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(
          SettingsState.empty(),
        ) {
    on<SwitchThemeEvent>(_switchTheme);
  }

  Future<void> _switchTheme(
    SwitchThemeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      state.copyWith(
        darkMode: !state.darkMode,
      ),
    );
  }
}
