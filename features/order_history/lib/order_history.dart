library order_history;

import 'package:core/core.dart';

import 'order_history.gm.dart';

export 'order_history.gm.dart';
export 'src/ui/order_history_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class OrderHistoryModule extends $OrderHistoryModule {}
