import 'package:domain/domain.dart';

import '../entities/product/product_entity.dart';
import '../mappers/products_mapper.dart';
import '../providers/remote/api_provider.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ApiProvider _apiProvider;

  ProductsRepositoryImpl({
    required ApiProvider apiProvider,
  }) : _apiProvider = apiProvider;

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    final List<ProductEntity> productsFromApi =
        await _apiProvider.getProducts();

    return productsFromApi
        .map((ProductEntity e) => ProductMapper.toModel(e))
        .toList();
  }
}
