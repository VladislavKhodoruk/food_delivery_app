class ProductModel {
  final String name;
  final String id;
  final String description;
  final double cost;
  final String image;
  final String category;
  final List<String> ingredients;

  ProductModel({
    required this.name,
    required this.id,
    required this.description,
    required this.cost,
    required this.image,
    required this.category,
    required this.ingredients,
  });
}
