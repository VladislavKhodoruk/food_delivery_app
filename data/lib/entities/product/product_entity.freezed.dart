// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductEntity _$ProductEntityFromJson(Map<String, dynamic> json) {
  return _ProductEntity.fromJson(json);
}

/// @nodoc
mixin _$ProductEntity {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String get description => throw _privateConstructorUsedError;
  @HiveField(3)
  double get cost => throw _privateConstructorUsedError;
  @HiveField(4)
  String get image => throw _privateConstructorUsedError;
  @HiveField(5)
  String get category => throw _privateConstructorUsedError;
  @HiveField(6)
  List<String> get ingredients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductEntityCopyWith<ProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEntityCopyWith<$Res> {
  factory $ProductEntityCopyWith(
          ProductEntity value, $Res Function(ProductEntity) then) =
      _$ProductEntityCopyWithImpl<$Res, ProductEntity>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String id,
      @HiveField(2) String description,
      @HiveField(3) double cost,
      @HiveField(4) String image,
      @HiveField(5) String category,
      @HiveField(6) List<String> ingredients});
}

/// @nodoc
class _$ProductEntityCopyWithImpl<$Res, $Val extends ProductEntity>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? description = null,
    Object? cost = null,
    Object? image = null,
    Object? category = null,
    Object? ingredients = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductEntityCopyWith<$Res>
    implements $ProductEntityCopyWith<$Res> {
  factory _$$_ProductEntityCopyWith(
          _$_ProductEntity value, $Res Function(_$_ProductEntity) then) =
      __$$_ProductEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String id,
      @HiveField(2) String description,
      @HiveField(3) double cost,
      @HiveField(4) String image,
      @HiveField(5) String category,
      @HiveField(6) List<String> ingredients});
}

/// @nodoc
class __$$_ProductEntityCopyWithImpl<$Res>
    extends _$ProductEntityCopyWithImpl<$Res, _$_ProductEntity>
    implements _$$_ProductEntityCopyWith<$Res> {
  __$$_ProductEntityCopyWithImpl(
      _$_ProductEntity _value, $Res Function(_$_ProductEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? description = null,
    Object? cost = null,
    Object? image = null,
    Object? category = null,
    Object? ingredients = null,
  }) {
    return _then(_$_ProductEntity(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductEntity implements _ProductEntity {
  _$_ProductEntity(
      {@HiveField(0) required this.name,
      @HiveField(1) required this.id,
      @HiveField(2) required this.description,
      @HiveField(3) required this.cost,
      @HiveField(4) required this.image,
      @HiveField(5) required this.category,
      @HiveField(6) required final List<String> ingredients})
      : _ingredients = ingredients;

  factory _$_ProductEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ProductEntityFromJson(json);

  @override
  @HiveField(0)
  final String name;
  @override
  @HiveField(1)
  final String id;
  @override
  @HiveField(2)
  final String description;
  @override
  @HiveField(3)
  final double cost;
  @override
  @HiveField(4)
  final String image;
  @override
  @HiveField(5)
  final String category;
  final List<String> _ingredients;
  @override
  @HiveField(6)
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  String toString() {
    return 'ProductEntity(name: $name, id: $id, description: $description, cost: $cost, image: $image, category: $category, ingredients: $ingredients)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, id, description, cost,
      image, category, const DeepCollectionEquality().hash(_ingredients));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductEntityCopyWith<_$_ProductEntity> get copyWith =>
      __$$_ProductEntityCopyWithImpl<_$_ProductEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductEntityToJson(
      this,
    );
  }
}

abstract class _ProductEntity implements ProductEntity {
  factory _ProductEntity(
          {@HiveField(0) required final String name,
          @HiveField(1) required final String id,
          @HiveField(2) required final String description,
          @HiveField(3) required final double cost,
          @HiveField(4) required final String image,
          @HiveField(5) required final String category,
          @HiveField(6) required final List<String> ingredients}) =
      _$_ProductEntity;

  factory _ProductEntity.fromJson(Map<String, dynamic> json) =
      _$_ProductEntity.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get id;
  @override
  @HiveField(2)
  String get description;
  @override
  @HiveField(3)
  double get cost;
  @override
  @HiveField(4)
  String get image;
  @override
  @HiveField(5)
  String get category;
  @override
  @HiveField(6)
  List<String> get ingredients;
  @override
  @JsonKey(ignore: true)
  _$$_ProductEntityCopyWith<_$_ProductEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
