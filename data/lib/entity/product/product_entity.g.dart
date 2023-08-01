// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductEntity _$$_ProductEntityFromJson(Map<String, dynamic> json) =>
    _$_ProductEntity(
      name: json['name'] as String,
      id: json['id'] as String,
      description: json['description'] as String,
      cost: (json['cost'] as num).toDouble(),
      image: json['image'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$$_ProductEntityToJson(_$_ProductEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'description': instance.description,
      'cost': instance.cost,
      'image': instance.image,
      'category': instance.category,
    };
