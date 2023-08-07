import 'package:domain/models/product/product_model.dart';
import '../entity/product/product_entity.dart';

abstract class ProductMapper {
  static ProductEntity toEntity(ProductModel model) {
    return ProductEntity(
        name: model.name,
        description: model.description,
        cost: model.cost,
        image: model.image,
        id: model.id,
        category: model.category,
        ingredients: model.ingredients);
  }

  static ProductModel toModel(ProductEntity entity) {
    return ProductModel(
      name: entity.name,
      description: entity.description,
      cost: entity.cost,
      image: entity.image,
      id: entity.id,
      category: entity.category,
      ingredients: entity.ingredients,
    );
  }
}
