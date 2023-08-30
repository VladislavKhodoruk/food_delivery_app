import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final AddCartItemToStorageUseCase _addCartItemToStorageUseCase;
  final DeleteCartItemFromStorageUseCase _deleteCartItemFromStorageUseCase;

  DetailsBloc(
      {required AddCartItemToStorageUseCase addCartItemToStorageUseCase,
      required DeleteCartItemFromStorageUseCase
          deleteCartItemFromStorageUseCase,
      required CartItemModel cartItem})
      : _addCartItemToStorageUseCase = addCartItemToStorageUseCase,
        _deleteCartItemFromStorageUseCase = deleteCartItemFromStorageUseCase,
        super(
          DetailsState(cartItem: cartItem),
        ) {
    on<AddItemEvent>(_addItem);
    on<DeleteItemEvent>(_deleteItem);
  }

  Future<void> _addItem(
    AddItemEvent event,
    Emitter<DetailsState> emit,
  ) async {
    CartItemModel eventCartItem = state.cartItem;
    eventCartItem.incrementAmount();
    _addCartItemToStorageUseCase.execute(eventCartItem);
    emit(
      state.copyWith(),
    );
  }

  Future<void> _deleteItem(
    DeleteItemEvent event,
    Emitter<DetailsState> emit,
  ) async {
    CartItemModel eventCartItem = state.cartItem;
    eventCartItem.decrementAmount();
    if (eventCartItem.amount > 0) {
      await _addCartItemToStorageUseCase.execute(eventCartItem);
    } else {
      await _deleteCartItemFromStorageUseCase.execute(state.cartItem);
    }
    emit(
      state.copyWith(),
    );
  }
}
