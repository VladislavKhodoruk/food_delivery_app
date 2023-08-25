part of 'details_bloc.dart';

abstract class DetailsEvent {
  const DetailsEvent();
}

class AddItemEvent extends DetailsEvent {
  AddItemEvent();
}

class DeleteItemEvent extends DetailsEvent {
  DeleteItemEvent();
}
