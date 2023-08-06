import 'package:core/core.dart';
import 'package:cart/cart.dart';
import 'package:main/main.dart';
import 'package:home/home.dart';
import 'package:order_history/order_history.dart';
import 'package:settings/settings.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: [
    MainModule,
    HomeModule,
    CartModule,
    SettingsModule,
    OrderHistoryModule
  ],
  replaceInRouteName: 'Screen,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: MainRoute.page,
      initial: true,
      children: [
        AutoRoute(path: 'home', page: HomeRoute.page, initial: true),
        AutoRoute(path: 'cart', page: CartRoute.page),
        AutoRoute(path: 'settings', page: SettingsRoute.page),
        AutoRoute(path: 'order_history', page: OrderHistoryRoute.page),
      ],
    ),
  ];
}
