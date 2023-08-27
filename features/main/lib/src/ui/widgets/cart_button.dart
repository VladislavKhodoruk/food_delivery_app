import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../../bloc/main/main_bloc.dart';
import '../../bloc/main/main_bloc_observer.dart';

class CartButton extends StatelessWidget {
  final bool isActive;

  const CartButton({
    this.isActive = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: <Widget>[
        Container(
          alignment: AlignmentDirectional.center,
          child: Icon(
            Icons.shopping_bag_outlined,
            color: isActive ? theme.colorScheme.primary : theme.iconTheme.color,
          ),
        ),
        BlocProvider<MainBloc>(
          create: (BuildContext context) => MainBloc(
            getAllCartItemsFromStorageUseCase:
                appLocator.get<GetAllCartItemsFromStorageUseCase>(),
          ),
          child: BlocBuilder<MainBloc, MainState>(
            builder: (
              BuildContext context,
              MainState state,
            ) {
              Bloc.observer = MainBlocObserver(context: context);
              return state.totalCost > 0
                  ? Positioned(
                      left: 57,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: theme.colorScheme.secondaryContainer,
                          border: Border.all(
                            color: theme.iconTheme.color as Color,
                          ),
                        ),
                        child: Text(
                          '${state.totalCost.toString()}\$',
                          style: theme.textTheme.labelSmall,
                        ),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
