library cart;

import 'package:core/core.dart';

export 'src/ui/cart_screen.dart';

import 'cart.gm.dart';
export 'cart.gm.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class CartModule extends $CartModule {}
