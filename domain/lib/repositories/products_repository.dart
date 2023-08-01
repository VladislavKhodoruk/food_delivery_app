import 'package:domain/models/product/product_model.dart';

abstract class ProductsRepository {
  Future<List<ProductModel>> fetchAllProducts();
}
