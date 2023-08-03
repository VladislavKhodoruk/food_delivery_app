import 'package:data/entity/product/product_entity.dart';
import 'package:data/providers/api_provider.dart';
import 'package:domain/repositories/products_repository.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:data/mappers/products_mapper.dart';

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
