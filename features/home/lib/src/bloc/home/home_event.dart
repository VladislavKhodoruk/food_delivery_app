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
