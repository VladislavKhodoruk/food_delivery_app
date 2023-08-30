library details;

import 'package:core/core.dart';

import 'details.gm.dart';

export 'details.gm.dart';
export 'src/ui/details_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class DetailsModule extends $DetailsModule {}
