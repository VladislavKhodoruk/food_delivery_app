import 'package:core/constants/constants.dart';
import 'package:hive/hive.dart';

import '../../entities/cart_item/cart_item_entity.dart';

class HiveProvider {
  HiveProvider();

  late final Box<CartItemEntity> _cartBox;

  Future<void> openBoxes() async {
    _cartBox = await Hive.openBox<CartItemEntity>(LocalConstants.cartBox);
  }

  Future<void> addCartItem(CartItemEntity cartItem) async {
    _cartBox.put(cartItem.product.id, cartItem);
  }

  Future<void> deleteCartItem(CartItemEntity cartItem) async {
    _cartBox.delete(cartItem.product.id);
  }

  Future<List<CartItemEntity>> getAllCartItems() async {
    return _cartBox.values.toList();
  }

  Future<void> deleteAllCartItems() async {
    await _cartBox.clear();
  }
}
