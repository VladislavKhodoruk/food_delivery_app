// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:details/src/ui/details_screen.dart' as _i1;
import 'package:domain/domain.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

abstract class $DetailsModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailsScreen(
          cartItem: args.cartItem,
          key: args.key,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.DetailsScreen]
class DetailsRoute extends _i2.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    required _i3.CartItemModel cartItem,
    _i4.Key? key,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            cartItem: cartItem,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const _i2.PageInfo<DetailsRouteArgs> page =
      _i2.PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    required this.cartItem,
    this.key,
  });

  final _i3.CartItemModel cartItem;

  final _i4.Key? key;

  @override
  String toString() {
    return 'DetailsRouteArgs{cartItem: $cartItem, key: $key}';
  }
}
