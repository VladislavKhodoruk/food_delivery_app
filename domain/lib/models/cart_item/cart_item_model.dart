import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final ProductModel product;
  int _amount;

  CartItemModel({
    required this.product,
    required int amount,
  }) : _amount = amount;

  int get amount => _amount;

  void incrementAmount() => _amount++;

  void decrementAmount() => _amount--;

  double get totalCost => _amount * product.cost;

  CartItemModel copyWith({
    ProductModel? product,
    int? amount,
  }) {
    return CartItemModel(
      product: product ?? this.product,
      amount: amount ?? _amount,
    );
  }

  @override
  List<Object?> get props => [_amount];
}
