library home;

import 'package:core/core.dart';

import 'home.gm.dart';

export 'home.gm.dart';
export 'src/bloc/home_bloc.dart';
export 'src/ui/home_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class HomeModule extends $HomeModule {}
