import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:details/src/ui/text_label.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/details/details_bloc.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  final CartItemModel cartItem;

  const DetailsScreen({
    required this.cartItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailsBloc(
        cartItem: cartItem,
        addCartItemToStorageUseCase:
            appLocator.get<AddCartItemToStorageUseCase>(),
        deleteCartItemFromStorageUseCase:
            appLocator.get<DeleteCartItemFromStorageUseCase>(),
      ),
      child: const _DetailsContent(),
    );
  }
}

class _DetailsContent extends StatelessWidget {
  const _DetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final DetailsBloc bloc = context.read<DetailsBloc>();

    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (
        BuildContext context,
        DetailsState state,
      ) {
        return GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx > 0) {
              context.router.pop();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 65,
              title: Text(state.cartItem.product.name.capitalizeEveryWord()),
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            body: Wrapper(
              Stack(
                children: <Widget>[
                  CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 70),
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                      state.cartItem.product.image,
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: TransparentLabel(
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Text(
                                        '${state.cartItem.product.cost}\$',
                                        style: theme.textTheme.headlineMedium
                                            ?.copyWith(
                                          color: theme.colorScheme.secondary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Text(
                                '\t\t\t${state.cartItem.product.description}',
                                style: theme.textTheme.bodyLarge,
                              ),
                              const SizedBox(height: 15),
                              Divider(
                                indent: 20,
                                endIndent: 20,
                                color: theme.dividerColor,
                              ),
                              const SizedBox(height: 15),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Wrap(
                                  spacing: 8.0, // gap between adjacent chips
                                  runSpacing: 4.0, // gap between lines
                                  children: List<Widget>.generate(
                                    state.cartItem.product.ingredients.length,
                                    // place the length of the array here
                                    (int index) {
                                      return TextLabel(
                                        state.cartItem.product
                                            .ingredients[index],
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: _buttonContent(
                      theme,
                      bloc,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _buttonContent(
  ThemeData theme,
  DetailsBloc bloc,
) {
  if (bloc.state.cartItem.amount == 0) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          bloc.add(
            AddItemEvent(),
          );
        },
        child: Icon(
          Icons.add_rounded,
          size: 30,
          color: theme.colorScheme.secondary,
        ),
      ),
    );
  } else {
    return SizedBox(
      height: 45,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  bloc.add(
                    DeleteItemEvent(),
                  );
                },
                child: Icon(
                  Icons.remove_rounded,
                  size: 30,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: theme.scaffoldBackgroundColor.withOpacity(0.7),
              child: Center(
                child: Text(
                  bloc.state.cartItem.amount.toString(),
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  bloc.add(
                    AddItemEvent(),
                  );
                },
                child: Icon(
                  Icons.add_rounded,
                  size: 30,
                  color: theme.colorScheme.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
