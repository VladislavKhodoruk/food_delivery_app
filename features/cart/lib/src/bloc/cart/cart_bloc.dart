import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddCartItemToStorageUseCase _addCartItemToStorageUseCase;
  final DeleteCartItemFromStorageUseCase _deleteCartItemFromStorageUseCase;
  final GetAllCartItemsFromStorageUseCase _getAllCartItemsFromStorageUseCase;
  final AppRouter _appRouter;

  CartBloc({
    required AppRouter appRouter,
    required AddCartItemToStorageUseCase addCartItemToStorageUseCase,
    required DeleteCartItemFromStorageUseCase deleteCartItemFromStorageUseCase,
    required GetAllCartItemsFromStorageUseCase
        getAllCartItemsFromStorageUseCase,
  })  : _appRouter = appRouter,
        _addCartItemToStorageUseCase = addCartItemToStorageUseCase,
        _deleteCartItemFromStorageUseCase = deleteCartItemFromStorageUseCase,
        _getAllCartItemsFromStorageUseCase = getAllCartItemsFromStorageUseCase,
        super(
          CartState.empty(),
        ) {
    on<AddCartItemEvent>(_addItem);
    on<DeleteCartItemEvent>(_deleteItem);
    on<GetCartItemsFromStorageEvent>(_getAllCartItems);

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
    List<CartItemModel> newItems = state.cartItems;
    final CartItemModel eventCartItem = event.cartItem;
    final int index = newItems
        .indexWhere((item) => item.product.id == eventCartItem.product.id);
    newItems[index] = eventCartItem.copyWith(amount: eventCartItem.amount + 1);
    await _addCartItemToStorageUseCase.execute(newItems[index]);
    emit(
      state.copyWith(
        cartItems: newItems,
      ),
    );
  }

  Future<void> _deleteItem(
    DeleteCartItemEvent event,
    Emitter<CartState> emit,
  ) async {
    List<CartItemModel> newItems = state.cartItems;
    final CartItemModel eventCartItem = event.cartItem;
    final CartItemModel newItem =
        eventCartItem.copyWith(amount: eventCartItem.amount - 1);

    if (newItem.amount > 0) {
      await _addCartItemToStorageUseCase.execute(newItem);
      final int index = newItems
          .indexWhere((item) => item.product.id == eventCartItem.product.id);
      newItems[index] = eventCartItem.copyWith(amount: newItem.amount);
    } else {
      await _deleteCartItemFromStorageUseCase.execute(eventCartItem);
      newItems.remove(eventCartItem);
    }

    emit(
      state.copyWith(
        cartItems: newItems,
      ),
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

  @override
  Future<void> close() async {
    _appRouter.removeListener(_initListener);
    super.close();
  }
}
