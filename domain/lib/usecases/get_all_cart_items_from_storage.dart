import 'package:domain/domain.dart';

class GetAllCartItemsFromStorageUseCase
    implements FutureUseCase<NoParams, List<CartItemModel>> {
  final CartRepository _cartRepository;

  const GetAllCartItemsFromStorageUseCase({
    required CartRepository cartRepository,
  }) : _cartRepository = cartRepository;

  @override
  Future<List<CartItemModel>> execute(NoParams input) async {
    return _cartRepository.getCartItems();
  }
}
