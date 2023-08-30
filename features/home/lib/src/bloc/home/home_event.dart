part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class LoadHomeEvent extends HomeEvent {
  LoadHomeEvent();
}

class SetCategoryEvent extends HomeEvent {
  final String category;

  SetCategoryEvent(this.category);
}

class FilterHomeEvent extends HomeEvent {
  FilterHomeEvent();
}

class NavigateOnDetailsEvent extends HomeEvent {
  final int index;

  NavigateOnDetailsEvent(this.index);
}

class AddItemEvent extends HomeEvent {
  final CartItemModel cartItem;

  AddItemEvent(this.cartItem);
}

class DeleteItemEvent extends HomeEvent {
  final CartItemModel cartItem;

  DeleteItemEvent(this.cartItem);
}

class SynchronizeWithStorageEvent extends HomeEvent {
  SynchronizeWithStorageEvent();
}
