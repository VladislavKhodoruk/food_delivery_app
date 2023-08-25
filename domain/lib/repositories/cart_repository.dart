import '../models/cart_item/cart_item_model.dart';

abstract class CartRepository {
  Future<List<CartItemModel>> getCartItems();

  Future<void> addItemToCart(CartItemModel cartItem);

  Future<void> deleteItemFromCart(CartItemModel cartItem);
}
