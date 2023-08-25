import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../product/product_entity.dart';

part 'cart_item_entity.freezed.dart';

part 'cart_item_entity.g.dart';

@freezed
@HiveType(typeId: 1, adapterName: 'CartItemEntityAdapter')
class CartItemEntity with _$CartItemEntity {
  factory CartItemEntity({
    @HiveField(0) required ProductEntity product,
    @HiveField(1) required int amount,
  }) = _CartItemEntity;

  factory CartItemEntity.fromJson(Map<String, Object?> json) =>
      _$CartItemEntityFromJson(json);
}
