// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:details/src/ui/details_screen.dart' as _i1;
import 'package:domain/models/product/product_model.dart' as _i4;
import 'package:flutter/material.dart' as _i3;

abstract class $DetailsModule extends _i2.AutoRouterModule {
  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.DetailsScreen(
          key: args.key,
          product: args.product,
        ),
      );
    }
  };
}

/// generated route for
/// [_i1.DetailsScreen]
class DetailsRoute extends _i2.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i3.Key? key,
    required _i4.ProductModel product,
    List<_i2.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            product: product,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const _i2.PageInfo<DetailsRouteArgs> page =
      _i2.PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.product,
  });

  final _i3.Key? key;

  final _i4.ProductModel product;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, product: $product}';
  }
}
