import 'package:domain/domain.dart';

import '../entities/cart_item/cart_item_entity.dart';
import 'products_mapper.dart';

abstract class CartItemsMapper {
  static CartItemEntity toEntity(CartItemModel model) {
    return CartItemEntity(
      product: ProductMapper.toEntity(model.product),
      amount: model.amount,
    );
  }

  static CartItemModel toModel(CartItemEntity entity) {
    return CartItemModel(
      product: ProductMapper.toModel(entity.product),
      amount: entity.amount,
    );
  }
}
