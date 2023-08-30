import 'package:domain/domain.dart';

class DeleteAllCartItemsFromStorageUseCase
    implements FutureUseCase<NoParams, void> {
  final CartRepository _cartRepository;

  const DeleteAllCartItemsFromStorageUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(NoParams input) async {
    return _cartRepository.deleteAllItemsFromCart();
  }
}
