import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final GetAllCartItemsFromStorageUseCase _getAllCartItemsFromStorageUseCase;

  MainBloc({
    required GetAllCartItemsFromStorageUseCase
        getAllCartItemsFromStorageUseCase,
  })  : _getAllCartItemsFromStorageUseCase = getAllCartItemsFromStorageUseCase,
        super(
          MainState.empty(),
        ) {
    on<CountTotalCostEvent>(_countTotalCost);
  }

  Future<void> _countTotalCost(
    CountTotalCostEvent event,
    Emitter<MainState> emit,
  ) async {
    final List<CartItemModel> cartItems =
        await _getAllCartItemsFromStorageUseCase.execute(const NoParams());
    final double newTotalCost = cartItems.fold(
        0, (totalCost, element) => totalCost + element.totalCost);
    emit(
      state.copyWith(
        totalCost: newTotalCost,
      ),
    );
  }
}
