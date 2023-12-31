import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchAllProductsUseCase _fetchAllProductsUseCase;
  final AddCartItemToStorageUseCase _addCartItemToStorageUseCase;
  final DeleteCartItemFromStorageUseCase _deleteCartItemFromStorageUseCase;
  final GetAllCartItemsFromStorageUseCase _getAllCartItemsFromStorageUseCase;
  final AppRouter _appRouter;

  HomeBloc({
    required AppRouter appRouter,
    required FetchAllProductsUseCase fetchAllProductsUseCase,
    required AddCartItemToStorageUseCase addCartItemToStorageUseCase,
    required DeleteCartItemFromStorageUseCase deleteCartItemFromStorageUseCase,
    required GetAllCartItemsFromStorageUseCase
        getAllCartItemsFromStorageUseCase,
  })  : _appRouter = appRouter,
        _fetchAllProductsUseCase = fetchAllProductsUseCase,
        _addCartItemToStorageUseCase = addCartItemToStorageUseCase,
        _deleteCartItemFromStorageUseCase = deleteCartItemFromStorageUseCase,
        _getAllCartItemsFromStorageUseCase = getAllCartItemsFromStorageUseCase,
        super(
          HomeState.empty(),
        ) {
    on<LoadHomeEvent>(_loadProducts);
    on<FilterHomeEvent>(_filterProducts);
    on<SetCategoryEvent>(_setCategory);
    on<NavigateOnDetailsEvent>(_navigateOnDetails);
    on<AddItemEvent>(_addItem);
    on<DeleteItemEvent>(_deleteItem);
    on<SynchronizeWithStorageEvent>(_synchronizeWithStorage);

    _appRouter.addListener(_initListener);

    add(LoadHomeEvent());
  }

  void _initListener() {
    final String topRouteName = _appRouter.topRoute.name;
    if (topRouteName == 'HomeRoute') {
      add(SynchronizeWithStorageEvent());
    }
  }

  Future<void> _loadProducts(
    LoadHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        loadingStatus: LoadingStatus.loading,
      ),
    );
    try {
      final List<ProductModel> productsFromApi =
          await _fetchAllProductsUseCase.execute(const NoParams());
      final List<CartItemModel> cartItems = productsFromApi
          .map((ProductModel currentProduct) =>
              CartItemModel(product: currentProduct, amount: 0))
          .toList();
      emit(
        state.copyWith(
          loadingStatus: LoadingStatus.loaded,
          cartItems: cartItems,
        ),
      );
      add(FilterHomeEvent());
      add(SynchronizeWithStorageEvent());
    } catch (e, _) {
      emit(
        state.copyWith(
          loadingStatus: LoadingStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _setCategory(
      SetCategoryEvent event, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        category: event.category,
      ),
    );
    add(FilterHomeEvent());
  }

  Future<void> _filterProducts(
    FilterHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state.category.isEmpty) {
      emit(
        state.copyWith(
          filteredCartItems: state.cartItems,
        ),
      );
    } else {
      List<CartItemModel> newFilteredProducts = state.cartItems
          .where((CartItemModel currentCartItem) =>
              currentCartItem.product.category == state.category)
          .toList();

      emit(
        state.copyWith(
          filteredCartItems: newFilteredProducts,
        ),
      );
    }
    add(SynchronizeWithStorageEvent());
  }

  Future<void> _navigateOnDetails(
    NavigateOnDetailsEvent event,
    Emitter<HomeState> emit,
  ) async {
    _appRouter.push(
      DetailsRoute(
        cartItem: state.filteredCartItems[event.index],
      ),
    );
  }

  Future<void> _addItem(
    AddItemEvent event,
    Emitter<HomeState> emit,
  ) async {
    final CartItemModel eventCartItem = event.cartItem;
    eventCartItem.incrementAmount();
    await _addCartItemToStorageUseCase.execute(eventCartItem);
    emit(
      state.copyWith(),
    );
  }

  Future<void> _deleteItem(
    DeleteItemEvent event,
    Emitter<HomeState> emit,
  ) async {
    final CartItemModel eventCartItem = event.cartItem;
    eventCartItem.decrementAmount();

    if (eventCartItem.amount > 0) {
      await _addCartItemToStorageUseCase.execute(eventCartItem);
    } else {
      state.cartItems.removeWhere((CartItemModel currentCartItem) =>
          currentCartItem.product.id == eventCartItem.product.id);
      await _deleteCartItemFromStorageUseCase.execute(event.cartItem);
    }
    emit(
      state.copyWith(),
    );
  }

  Future<void> _synchronizeWithStorage(
    SynchronizeWithStorageEvent event,
    Emitter<HomeState> emit,
  ) async {
    final List<CartItemModel> cartItems = state.filteredCartItems;
    final List<CartItemModel> cartItemsFromStorage =
        await _getAllCartItemsFromStorageUseCase.execute(const NoParams());

    final List<CartItemModel> synchronizedCartItems =
        cartItems.map((CartItemModel cartItem) {
      int index = cartItemsFromStorage.indexWhere(
          (CartItemModel currentCartItem) =>
              currentCartItem.product.id == cartItem.product.id);
      if (index != -1) {
        return cartItem.copyWith(amount: cartItemsFromStorage[index].amount);
      }
      return cartItem.copyWith(amount: 0);
    }).toList();

    emit(
      state.copyWith(
        filteredCartItems: synchronizedCartItems,
      ),
    );
  }

  @override
  Future<void> close() async {
    _appRouter.removeListener(_initListener);
    super.close();
  }
}
