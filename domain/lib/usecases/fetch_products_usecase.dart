import '../domain.dart';

class FetchAllProductsUseCase implements FutureUseCase<NoParams, List<ProductModel>> {
  final ProductsRepository _productsRepository;

  const FetchAllProductsUseCase({
    required ProductsRepository productsRepository,
  }) : _productsRepository = productsRepository;

  @override
  Future<List<ProductModel>> execute(NoParams input) async {
    return _productsRepository.fetchAllProducts();
  }
}
