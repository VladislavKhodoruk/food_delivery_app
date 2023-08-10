import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/home_bloc.dart';
import 'popup_menu.dart';
import 'product_item.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(
          key: key,
        );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(
        fetchAllProductsUseCase: appLocator.get<FetchAllProductsUseCase>(),
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (
          BuildContext context,
          HomeState state,
        ) {
          final HomeBloc bloc = context.read<HomeBloc>();

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
                    menuOptions: state.products
                        .map(
                          (ProductModel product) => product.category,
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
                child: _content(state, theme),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _content(
    HomeState state,
    ThemeData theme,
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
      if (state.filteredProducts.isEmpty) {
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
          itemCount: state.filteredProducts.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            return GestureDetector(
              onTap: () => context.router.push(
                DetailsRoute(
                  product: state.filteredProducts[index],
                ),
              ),
              child: ProductItem(
                productItem: state.filteredProducts[index],
                key: ValueKey(
                  state.filteredProducts[index].id,
                ),
              ),
            );
          },
        );
      }
    }
    return const SizedBox.shrink();
  }
}
