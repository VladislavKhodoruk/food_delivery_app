import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddCartItemToStorageUseCase _addCartItemToStorageUseCase;
  final DeleteCartItemFromStorageUseCase _deleteCartItemFromStorageUseCase;
  final GetAllCartItemsFromStorageUseCase _getAllCartItemsFromStorageUseCase;
  final DeleteAllCartItemsFromStorageUseCase
      _deleteAllCartItemsFromStorageUseCase;
  final AppRouter _appRouter;

  CartBloc({
    required AppRouter appRouter,
    required AddCartItemToStorageUseCase addCartItemToStorageUseCase,
    required DeleteCartItemFromStorageUseCase deleteCartItemFromStorageUseCase,
    required GetAllCartItemsFromStorageUseCase
        getAllCartItemsFromStorageUseCase,
    required DeleteAllCartItemsFromStorageUseCase
        deleteAllCartItemsFromStorageUseCase,
  })  : _appRouter = appRouter,
        _addCartItemToStorageUseCase = addCartItemToStorageUseCase,
        _deleteCartItemFromStorageUseCase = deleteCartItemFromStorageUseCase,
        _getAllCartItemsFromStorageUseCase = getAllCartItemsFromStorageUseCase,
        _deleteAllCartItemsFromStorageUseCase =
            deleteAllCartItemsFromStorageUseCase,
        super(
          CartState.empty(),
        ) {
    on<AddCartItemEvent>(_addItem);
    on<DeleteCartItemEvent>(_deleteItem);
    on<GetCartItemsFromStorageEvent>(_getAllCartItems);
    on<DeleteAllCartItemsEvent>(_deleteAllCartItems);

    _appRouter.addListener(_initListener);

    add(GetCartItemsFromStorageEvent());
  }

  void _initListener() {
    final String topRouteName = _appRouter.topRoute.name;
    if (topRouteName == 'CartRoute') {
      add(GetCartItemsFromStorageEvent());
    }
  }

  Future<void> _addItem(
    AddCartItemEvent event,
    Emitter<CartState> emit,
  ) async {
    final CartItemModel eventCartItem = event.cartItem;
    eventCartItem.incrementAmount();
    await _addCartItemToStorageUseCase.execute(eventCartItem);
    emit(
      state.copyWith(),
    );
  }

  Future<void> _deleteItem(
    DeleteCartItemEvent event,
    Emitter<CartState> emit,
  ) async {
    final CartItemModel eventCartItem = event.cartItem;
    eventCartItem.decrementAmount();

    if (eventCartItem.amount > 0) {
      await _addCartItemToStorageUseCase.execute(eventCartItem);
    } else {
      state.cartItems.removeWhere((CartItemModel currentCartItem) =>
          currentCartItem.product.id == eventCartItem.product.id);
      await _deleteCartItemFromStorageUseCase.execute(eventCartItem);
    }

    emit(
      state.copyWith(),
    );
  }

  Future<void> _getAllCartItems(
    GetCartItemsFromStorageEvent event,
    Emitter<CartState> emit,
  ) async {
    final List<CartItemModel> cartItemsFromStorage =
        await _getAllCartItemsFromStorageUseCase.execute(const NoParams());
    emit(
      state.copyWith(cartItems: cartItemsFromStorage),
    );
  }

  Future<void> _deleteAllCartItems(
    DeleteAllCartItemsEvent event,
    Emitter<CartState> emit,
  ) async {
    await _deleteAllCartItemsFromStorageUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        cartItems: <CartItemModel>[],
      ),
    );
  }

  @override
  Future<void> close() async {
    _appRouter.removeListener(_initListener);
    super.close();
  }
}
