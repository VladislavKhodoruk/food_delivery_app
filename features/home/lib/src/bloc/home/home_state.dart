part of 'home_bloc.dart';

class HomeState {
  final LoadingStatus loadingStatus;
  final String category;
  final List<CartItemModel> cartItems;
  final List<CartItemModel> filteredCartItems;
  final String errorMessage;

  const HomeState({
    required this.loadingStatus,
    required this.category,
    required this.cartItems,
    required this.filteredCartItems,
    required this.errorMessage,
  });

  HomeState.empty({
    this.loadingStatus = LoadingStatus.loading,
    this.category = '',
    this.cartItems = const <CartItemModel>[],
    this.filteredCartItems = const <CartItemModel>[],
    this.errorMessage = '',
  });

  HomeState copyWith({
    LoadingStatus? loadingStatus,
    String? category,
    List<CartItemModel>? cartItems,
    List<CartItemModel>? filteredCartItems,
    String? errorMessage,
  }) {
    return HomeState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      category: category ?? this.category,
      cartItems: cartItems ?? this.cartItems,
      filteredCartItems: filteredCartItems ?? this.filteredCartItems,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
