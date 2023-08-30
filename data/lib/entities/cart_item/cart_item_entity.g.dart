// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemEntityAdapter extends TypeAdapter<CartItemEntity> {
  @override
  final int typeId = 1;

  @override
  CartItemEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemEntity(
      product: fields[0] as ProductEntity,
      amount: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, CartItemEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.product)
      ..writeByte(1)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItemEntity _$$_CartItemEntityFromJson(Map<String, dynamic> json) =>
    _$_CartItemEntity(
      product: ProductEntity.fromJson(json['product'] as Map<String, dynamic>),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$$_CartItemEntityToJson(_$_CartItemEntity instance) =>
    <String, dynamic>{
      'product': instance.product,
      'amount': instance.amount,
    };
