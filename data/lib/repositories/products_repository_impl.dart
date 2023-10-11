import 'package:domain/domain.dart';

import '../entities/product/product_entity.dart';
import '../mappers/products_mapper.dart';
import '../providers/remote/firebase_provider.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final FirebaseProvider _firebaseProvider;

  ProductsRepositoryImpl({
    required FirebaseProvider firebaseProvider,
  }) : _firebaseProvider = firebaseProvider;

  @override
  Future<List<ProductModel>> fetchAllProducts() async {
    final List<ProductEntity> productsFromApi = await _firebaseProvider.getProducts();

    return productsFromApi.map((ProductEntity e) => ProductMapper.toModel(e)).toList();
  }
}
