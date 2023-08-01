part of 'bloc.dart';

abstract class ProductsEvent {
  const ProductsEvent();
}

class LoadProductsEvent extends ProductsEvent {
  LoadProductsEvent();
}

class SetCategoryEvent extends ProductsEvent {
  final String category;

  SetCategoryEvent(this.category);
}

class FilterProductsEvent extends ProductsEvent {
  FilterProductsEvent();
}