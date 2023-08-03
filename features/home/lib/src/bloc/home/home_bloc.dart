import 'package:core/core.dart';
import 'package:core/enums/api_enums.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:domain/usecases/usecases.dart';
import 'package:domain/usecases/usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchAllProductsUseCase _fetchAllProductsUseCase;
  HomeBloc({
    required FetchAllProductsUseCase fetchAllProductsUseCase,
  })  : _fetchAllProductsUseCase = fetchAllProductsUseCase,
        super(
          HomeState.empty(),
        ) {
    on<LoadHomeEvent>(_loadProducts);
    on<FilterHomeEvent>(_filterProducts);
    on<SetCategoryEvent>(_setCategory);

    add(LoadHomeEvent());
  }

  void _loadProducts(LoadHomeEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(loadingStatus: LoadingStatus.loading));
    try {
      final List<ProductModel> products =
          await _fetchAllProductsUseCase.execute(const NoParams());
      emit(state.copyWith(
          loadingStatus: LoadingStatus.loaded, products: products));
      add(FilterHomeEvent());
    } catch (e, _) {
      emit(state.copyWith(
          loadingStatus: LoadingStatus.error, errorMessage: e.toString()));
    }
  }

  void _setCategory(SetCategoryEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(category: event.category));
    add(FilterHomeEvent());
  }

  void _filterProducts(FilterHomeEvent event, Emitter<HomeState> emit) {
    if (state.category.isEmpty) {
      emit(state.copyWith(filteredProducts: state.products));
    } else {
      List<ProductModel> newFilteredProducts = state.products
          .where((ProductModel product) => product.category == state.category)
          .toList();
      emit(state.copyWith(filteredProducts: newFilteredProducts));
    }
  }
}
