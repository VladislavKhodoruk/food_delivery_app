import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/constants/constants.dart';
import 'package:data/entity/product/product_entity.dart';

class ApiProvider {
  final FirebaseFirestore _database;

  ApiProvider({
    required FirebaseFirestore database,
  }) : _database = database;

  Future<List<ProductEntity>> getProducts() async {
    final QuerySnapshot<Map<String, dynamic>> productsRawData =
        await _database.collection(ApiConstants.productsPath).get();

    return productsRawData.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
            ProductEntity.fromJson(e.data()))
        .toList();
  }
}
