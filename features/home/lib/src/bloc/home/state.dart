part of 'bloc.dart';

class ProductsState {
  final LoadingStatus loadingStatus;
  final String category;
  final List<ProductModel> products;
  final List<ProductModel> filteredProducts;
  final String? errorMessage;

  ProductsState({
    this.loadingStatus = LoadingStatus.loading,
    this.category = '',
    this.products = const [],
    this.filteredProducts = const [],
    this.errorMessage,
  });

  ProductsState copyWith({
    LoadingStatus? loadingStatus,
    String? category,
    List<ProductModel>? products,
    List<ProductModel>? filteredProducts,
    String? errorMessage,
  }) {
    return ProductsState(
      loadingStatus: loadingStatus ?? this.loadingStatus,
      category: category ?? this.category,
      products: products ?? this.products,
      filteredProducts: filteredProducts ?? this.filteredProducts,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
