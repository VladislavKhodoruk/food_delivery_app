library main;

import 'package:core/core.dart';

import 'main.gm.dart';

export 'main.gm.dart';
export 'src/ui/main_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class MainModule extends $MainModule {}
