part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddItemEvent extends CartEvent {
  final CartItemModel cartItem;

  AddItemEvent(this.cartItem);
}

class DeleteItemEvent extends CartEvent {
  final CartItemModel cartItem;

  DeleteItemEvent(this.cartItem);
}

class GetCartItemsFromStorageEvent extends CartEvent {
  GetCartItemsFromStorageEvent();
}
