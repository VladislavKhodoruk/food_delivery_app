import 'package:core/constants/constants.dart';
import 'package:hive/hive.dart';

import '../../entities/cart_item/cart_item_entity.dart';

class HiveProvider {
  HiveProvider();

  Future<void> addCartItem(CartItemEntity cartItem) async {
    final Box<CartItemEntity> box = await Hive.openBox(LocalConstants.cartBox);
    box.put(cartItem.product.id, cartItem);
  }

  Future<void> deleteCartItem(CartItemEntity cartItem) async {
    final Box<CartItemEntity> box = await Hive.openBox(LocalConstants.cartBox);
    box.delete(cartItem.product.id);
  }

  Future<List<CartItemEntity>> getAllCartItems() async {
    final Box<CartItemEntity> box = await Hive.openBox(LocalConstants.cartBox);
    return box.values.toList();
  }
}
