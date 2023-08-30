part of 'details_bloc.dart';

class DetailsState {
  final CartItemModel cartItem;

  const DetailsState({required this.cartItem});

  DetailsState copyWith({
    CartItemModel? cartItem,
  }) {
    return DetailsState(
      cartItem: cartItem ?? this.cartItem,
    );
  }
}
