// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartItemModel {
  ProductModel get product => throw _privateConstructorUsedError;

  int get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartItemModelCopyWith<CartItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemModelCopyWith<$Res> {
  factory $CartItemModelCopyWith(
          CartItemModel value, $Res Function(CartItemModel) then) =
      _$CartItemModelCopyWithImpl<$Res, CartItemModel>;

  @useResult
  $Res call({ProductModel product, int amount});

  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class _$CartItemModelCopyWithImpl<$Res, $Val extends CartItemModel>
    implements $CartItemModelCopyWith<$Res> {
  _$CartItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;

  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CartItemModelCopyWith<$Res>
    implements $CartItemModelCopyWith<$Res> {
  factory _$$_CartItemModelCopyWith(
          _$_CartItemModel value, $Res Function(_$_CartItemModel) then) =
      __$$_CartItemModelCopyWithImpl<$Res>;

  @override
  @useResult
  $Res call({ProductModel product, int amount});

  @override
  $ProductModelCopyWith<$Res> get product;
}

/// @nodoc
class __$$_CartItemModelCopyWithImpl<$Res>
    extends _$CartItemModelCopyWithImpl<$Res, _$_CartItemModel>
    implements _$$_CartItemModelCopyWith<$Res> {
  __$$_CartItemModelCopyWithImpl(
      _$_CartItemModel _value, $Res Function(_$_CartItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? amount = null,
  }) {
    return _then(_$_CartItemModel(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CartItemModel implements _CartItemModel {
  _$_CartItemModel({required this.product, required this.amount});

  @override
  final ProductModel product;
  @override
  final int amount;

  @override
  String toString() {
    return 'CartItemModel(product: $product, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItemModel &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartItemModelCopyWith<_$_CartItemModel> get copyWith =>
      __$$_CartItemModelCopyWithImpl<_$_CartItemModel>(this, _$identity);
}

abstract class _CartItemModel implements CartItemModel {
  factory _CartItemModel(
      {required final ProductModel product,
      required final int amount}) = _$_CartItemModel;

  @override
  ProductModel get product;

  @override
  int get amount;

  @override
  @JsonKey(ignore: true)
  _$$_CartItemModelCopyWith<_$_CartItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
