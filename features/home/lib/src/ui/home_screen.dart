import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'popup_menu.dart';
import 'product_item.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(
        fetchAllProductsUseCase: appLocator.get<FetchAllProductsUseCase>(),
        addCartItemToStorageUseCase:
            appLocator.get<AddCartItemToStorageUseCase>(),
        deleteCartItemFromStorageUseCase:
            appLocator.get<DeleteCartItemFromStorageUseCase>(),
        getAllCartItemsFromStorageUseCase:
            appLocator.get<GetAllCartItemsFromStorageUseCase>(),
        appRouter: appLocator.get<AppRouter>(),
      ),
      child: const _HomeContent(),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final HomeBloc bloc = context.read<HomeBloc>();

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (
        BuildContext context,
        HomeState state,
      ) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 65,
            title: const Text(
              LocaleKeys.appName,
            ).tr(),
            actions: <Widget>[
              Container(
                padding: const EdgeInsets.only(right: 4),
                child: PopupMenu(
                  selectedOption: state.category,
                  onPressed: (String category) => {
                    bloc.add(
                      SetCategoryEvent(category),
                    ),
                  },
                  menuOptions: state.cartItems
                      .map(
                        (CartItemModel cartItem) => cartItem.product.category,
                      )
                      .toList(),
                ),
              ),
            ],
          ),
          body: Wrapper(
            RefreshIndicator(
              backgroundColor: theme.colorScheme.secondary,
              onRefresh: () {
                return Future<void>(
                  () => bloc.add(
                    LoadHomeEvent(),
                  ),
                );
              },
              child: _content(state, theme, bloc),
            ),
          ),
        );
      },
    );
  }
}

Widget _content(
  HomeState state,
  ThemeData theme,
  HomeBloc bloc,
) {
  if (state.loadingStatus == LoadingStatus.error) {
    return Center(
      child: Text(
        state.errorMessage,
        style: theme.textTheme.headlineLarge,
      ),
    );
  }
  if (state.loadingStatus == LoadingStatus.loading) {
    return Center(
      child: SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }
  if (state.loadingStatus == LoadingStatus.loaded) {
    if (state.filteredCartItems.isEmpty) {
      return Center(
        child: Text(
          LocaleKeys.mainPage_common_noProducts.tr(),
          style: theme.textTheme.headlineLarge,
        ),
      );
    } else {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 2,
          childAspectRatio: 0.88,
        ),
        itemCount: state.filteredCartItems.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return GestureDetector(
            onTap: () {
              bloc.add(
                NavigateOnDetailsEvent(index),
              );
            },
            child: ProductItem(
              cartItem: state.filteredCartItems[index],
              key: ValueKey(
                state.filteredCartItems[index].product.id,
              ),
              onPlusTap: () {
                bloc.add(AddItemEvent(state.filteredCartItems[index]));
              },
              onMinusTap: () {
                bloc.add(DeleteItemEvent(state.filteredCartItems[index]));
              },
            ),
          );
        },
      );
    }
  }
  return const SizedBox.shrink();
}
