import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'product_entity.freezed.dart';
part 'product_entity.g.dart';

@freezed
@HiveType(typeId: 0)
class ProductEntity with _$ProductEntity {
  factory ProductEntity({
    @HiveField(0) required String name,
    @HiveField(1) required String id,
    @HiveField(2) required String description,
    @HiveField(3) required double cost,
    @HiveField(4) required String image,
    @HiveField(5) required String category,
    @HiveField(6) required List<String> ingredients,
  }) = _ProductEntity;

  factory ProductEntity.fromFirebase(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return ProductEntity.fromJson(data);
  }

  factory ProductEntity.fromJson(Map<String, Object?> json) =>
      _$ProductEntityFromJson(json);
}
