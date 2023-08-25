part of 'main_bloc.dart';

abstract class MainEvent {
  const MainEvent();
}

class CountTotalCostEvent extends MainEvent {
  CountTotalCostEvent();
}
