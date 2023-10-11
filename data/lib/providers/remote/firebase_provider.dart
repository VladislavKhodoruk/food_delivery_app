import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/constants/constants.dart';

import '../../entities/product/product_entity.dart';

class FirebaseProvider {
  final FirebaseFirestore _database;

  FirebaseProvider({
    required FirebaseFirestore database,
  }) : _database = database;

  Future<List<ProductEntity>> getProducts() async {
    final QuerySnapshot<Map<String, dynamic>> productsRawData =
        await _database.collection(ApiConstants.productsPath).get();

    return productsRawData.docs
        .map(
          (QueryDocumentSnapshot<Map<String, dynamic>> documentSnapshot) => ProductEntity.fromJson(
            documentSnapshot.data(),
          ),
        )
        .toList();
  }
}
