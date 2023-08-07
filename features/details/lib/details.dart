library details;

import 'package:core/core.dart';

export 'src/ui/details_screen.dart';

import 'details.gm.dart';
export 'details.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class DetailsModule extends $DetailsModule {}
