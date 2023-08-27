part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddCartItemEvent extends CartEvent {
  final CartItemModel cartItem;

  AddCartItemEvent(this.cartItem);
}

class DeleteCartItemEvent extends CartEvent {
  final CartItemModel cartItem;

  DeleteCartItemEvent(this.cartItem);
}

class GetCartItemsFromStorageEvent extends CartEvent {
  GetCartItemsFromStorageEvent();
}
