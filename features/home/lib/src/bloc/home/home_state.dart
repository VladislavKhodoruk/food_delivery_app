part of 'home_bloc.dart';

class HomeState {
  final LoadingStatus loadingStatus;
  final String category;
  final List<ProductModel> products;
  final List<ProductModel> filteredProducts;
  final String errorMessage;

  const HomeState({
    required this.loadingStatus,
    required this.category,
    required this.products,
    required this.filteredProducts,
    required this.errorMessage,
  });

  HomeState.empty({
    this.loadingStatus = LoadingStatus.loading,
    this.category = '',
    this.products = const [],
    this.filteredProducts = const [],
    this.errorMessage = '',
  });

  HomeState copyWith({
    LoadingStatus? loadingStatus,
    String? category,
    List<ProductModel>? products,
    List<ProductModel>? filteredProducts,
    String? errorMessage,
  }) {
    return HomeState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      category: category ?? this.category,
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
