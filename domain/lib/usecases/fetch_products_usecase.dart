import 'package:domain/models/product/product_model.dart';
import 'package:domain/repositories/products_repository.dart';
import 'package:domain/usecases/usecase.dart';

class FetchAllProductsUseCase
    implements FutureUseCase<NoParams, List<ProductModel>> {
  final ProductsRepository _productsRepository;

  const FetchAllProductsUseCase({
    required ProductsRepository productsRepository,
  }) : _productsRepository = productsRepository;

  @override
  Future<List<ProductModel>> execute(NoParams input) async {
    return _productsRepository.fetchAllProducts();
  }
}
