part of 'main_bloc.dart';

class MainState {
  final double totalCost;

  const MainState({
    required this.totalCost,
  });

  MainState.empty({
    this.totalCost = 0,
  });

  MainState copyWith({
    double? totalCost,
  }) {
    return MainState(
      totalCost: totalCost ?? this.totalCost,
    );
  }
}
