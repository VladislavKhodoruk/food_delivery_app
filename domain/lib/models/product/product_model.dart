import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';

@freezed
class ProductModel with _$ProductModel {
  factory ProductModel({
    required String name,
    required String id,
    required String description,
    required double cost,
    required String image,
    required String category,
  }) = _ProductModel;
}
