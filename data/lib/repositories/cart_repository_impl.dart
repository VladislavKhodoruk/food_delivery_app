import 'package:domain/domain.dart';

import '../entities/cart_item/cart_item_entity.dart';
import '../mappers/cart_items_mapper.dart';
import '../providers/local/hive_provider.dart';

class CartRepositoryImpl implements CartRepository {
  final HiveProvider _hiveProvider;

  CartRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<void> addItemToCart(CartItemModel cartItemModel) async {
    final CartItemEntity cartItemEntity =
        CartItemsMapper.toEntity(cartItemModel);
    await _hiveProvider.addCartItem(cartItemEntity);
  }

  @override
  Future<void> deleteItemFromCart(CartItemModel cartItemModel) async {
    final CartItemEntity entity = CartItemsMapper.toEntity(cartItemModel);
    await _hiveProvider.deleteCartItem(entity);
  }

  @override
  Future<List<CartItemModel>> getAllItemsFromCart() async {
    return (await _hiveProvider.getAllCartItems())
        .map(
          (e) => CartItemsMapper.toModel(e),
        )
        .toList();
  }

  @override
  Future<void> deleteAllItemsFromCart() async {
    await _hiveProvider.deleteAllCartItems();
  }
}
