library main;

import 'package:core/core.dart';

export 'src/ui/main_screen.dart';

import 'main.gm.dart';
export 'main.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class MainModule extends $MainModule {}
