import 'package:domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_model.freezed.dart';

@freezed
class CartItemModel with _$CartItemModel {
  factory CartItemModel({
    required ProductModel product,
    required int amount,
  }) = _CartItemModel;
}
