part of 'cart_bloc.dart';

class CartState {
  final List<CartItemModel> cartItems;

  const CartState({required this.cartItems});

  CartState.empty({
    this.cartItems = const [],
  });

  CartState copyWith({
    List<CartItemModel>? cartItems,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
    );
  }
}
