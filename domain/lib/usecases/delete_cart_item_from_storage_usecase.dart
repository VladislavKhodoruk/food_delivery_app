import '../domain.dart';

class DeleteCartItemFromStorageUseCase implements FutureUseCase<CartItemModel, void> {
  final CartRepository _cartRepository;

  const DeleteCartItemFromStorageUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(CartItemModel input) async {
    return _cartRepository.deleteItemFromCart(input);
  }
}
