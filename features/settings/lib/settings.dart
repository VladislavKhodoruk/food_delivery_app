library settings;

import 'package:core/core.dart';

import 'settings.gm.dart';

export 'settings.gm.dart';
export 'src/bloc/settings_bloc.dart';
export 'src/ui/settings_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class SettingsModule extends $SettingsModule {}
