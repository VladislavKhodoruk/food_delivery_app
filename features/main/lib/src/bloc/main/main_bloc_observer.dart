import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

import '../main_bloc.dart';

class MainBlocObserver extends BlocObserver {
  BuildContext context;

  MainBlocObserver({
    required this.context,
  });

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (bloc is HomeBloc || bloc is CartBloc) {
      BlocProvider.of<MainBloc>(context).add(CountTotalCostEvent());
    }
  }
}
