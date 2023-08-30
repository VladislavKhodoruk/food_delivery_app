library cart;

import 'package:core/core.dart';

import 'cart.gm.dart';

export 'cart.gm.dart';
export 'src/bloc/cart_bloc.dart';
export 'src/ui/cart_screen.dart';

@AutoRouterConfig.module(replaceInRouteName: 'Screen,Route')
class CartModule extends $CartModule {}
