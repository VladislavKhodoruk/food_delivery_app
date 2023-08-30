import 'package:cart/cart.dart';
import 'package:core/core.dart';
import 'package:home/home.dart';

import '../main_bloc.dart';

class MainBlocObserver extends BlocObserver {
  MainBloc mainBloc;

  MainBlocObserver(this.mainBloc);

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (bloc is HomeBloc || bloc is CartBloc) {
      mainBloc.add(CountTotalCostEvent());
    }
  }
}
