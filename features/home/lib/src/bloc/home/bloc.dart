import 'package:core/core.dart';
import 'package:core/enums/api_enums.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:domain/usecases/usecases.dart';
import 'package:domain/usecases/usecase.dart';

part 'event.dart';
part 'state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final FetchAllProductsUseCase _fetchAllProductsUseCase;
  ProductsBloc({
    required FetchAllProductsUseCase fetchAllProductsUseCase,
  })  : _fetchAllProductsUseCase = fetchAllProductsUseCase,
        super(ProductsState()) {
    on<LoadProductsEvent>(_loadProducts);
    on<FilterProductsEvent>(_filterProducts);
    on<SetCategoryEvent>(_setCategory);
  }

  @override
  // TODO: implement state
  ProductsState get state => super.state;

  void _loadProducts(
      LoadProductsEvent event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    try {
      final products = await _fetchAllProductsUseCase.execute(const NoParams());
      emit(state.copyWith(
          loadingStatus: LoadingStatus.loaded, products: products));
      add(FilterProductsEvent());
    } catch (e, _) {
      emit(state.copyWith(
          loadingStatus: LoadingStatus.error, errorMessage: e.toString()));
    }
  }

  void _setCategory(SetCategoryEvent event, Emitter<ProductsState> emit) {
    emit(state.copyWith(category: event.category));
    add(FilterProductsEvent());
  }

  void _filterProducts(FilterProductsEvent event, Emitter<ProductsState> emit) {
    if (state.category.isEmpty) {
      emit(state.copyWith(filteredProducts: state.products));
    } else {
      List<ProductModel> newFilteredProducts =
          state.products.where((el) => el.category == state.category).toList();
      emit(state.copyWith(filteredProducts: newFilteredProducts));
    }
  }
}
