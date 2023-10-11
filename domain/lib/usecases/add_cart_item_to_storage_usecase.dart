import '../domain.dart';

class AddCartItemToStorageUseCase implements FutureUseCase<CartItemModel, void> {
  final CartRepository _cartRepository;

  const AddCartItemToStorageUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<void> execute(CartItemModel input) async {
    return _cartRepository.addItemToCart(input);
  }
}
