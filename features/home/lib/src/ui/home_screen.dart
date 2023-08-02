import 'package:core/constants/app_text_constants.dart';
import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:core/enums/api_enums.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:flutter/material.dart';
import 'package:home/src/ui/main_bottom_navigation_bar.dart';
import 'product_item.dart';
import '../bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return BlocProvider<ProductsBloc>(
      create: (BuildContext context) => ProductsBloc(
        fetchAllProductsUseCase: appLocator.get<FetchAllProductsUseCase>(),
      )..add(LoadProductsEvent()),
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (BuildContext context, ProductsState state) {
          final bloc = context.read<ProductsBloc>();

          return SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.white,
                appBar: AppBar(
                  toolbarHeight: 65,
                  title: const Text(AppTextConstants.appName),
                  actions: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(right: 4),
                      child: PopupMenu(
                        selectedOption: state.category,
                        onPressed: (String category) =>
                            (bloc.add(SetCategoryEvent(category))),
                        menuOptions: state.products
                            .map((product) => product.category)
                            .toList(),
                      ),
                    ),
                  ],
                ),
                body: Container(
                  color: AppColors.blueLight,
                  child: RefreshIndicator(
                    onRefresh: () {
                      return Future<void>(() => bloc.add(LoadProductsEvent()));
                    },
                    child: (() {
                      if (state.loadingStatus == LoadingStatus.error) {
                        return Center(
                          child: Text(
                            state.errorMessage!,
                            style: textTheme.headlineLarge,
                          ),
                        );
                      }
                      if (state.loadingStatus == LoadingStatus.loading) {
                        return const Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(AppColors.red),
                            ),
                          ),
                        );
                      }
                      if (state.loadingStatus == LoadingStatus.loaded) {
                        if (state.filteredProducts.isEmpty) {
                          return Center(
                            child: Text(
                              AppTextConstants.emptyView,
                              style: textTheme.headlineLarge,
                            ),
                          );
                        } else {
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9),
                            padding: const EdgeInsets.all(18),
                            itemCount: state.filteredProducts.length,
                            itemBuilder: (
                              BuildContext context,
                              int index,
                            ) {
                              return ProductItem(
                                productItem: state.filteredProducts[index],
                                key: ValueKey(state.filteredProducts[index].id),
                              );
                            },
                          );
                        }
                      }
                      return Container();
                    }()),
                  ),
                ),
                bottomNavigationBar: const MainBottomNavigationBar()),
          );
        },
      ),
    );
  }
}
