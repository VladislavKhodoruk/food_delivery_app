import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import 'widgets/cart_item.dart';

@RoutePage()
class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(
        appRouter: appLocator.get<AppRouter>(),
        addCartItemToStorageUseCase:
            appLocator.get<AddCartItemToStorageUseCase>(),
        deleteCartItemFromStorageUseCase:
            appLocator.get<DeleteCartItemFromStorageUseCase>(),
        getAllCartItemsFromStorageUseCase:
            appLocator.get<GetAllCartItemsFromStorageUseCase>(),
        deleteAllCartItemsFromStorageUseCase:
            appLocator.get<DeleteAllCartItemsFromStorageUseCase>(),
      ),
      child: const _CartContent(),
    );
  }
}

class _CartContent extends StatelessWidget {
  const _CartContent({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return BlocBuilder<CartBloc, CartState>(
      builder: (
        BuildContext context,
        CartState state,
      ) {
        return AppScaffold(
          title: const Text(LocaleKeys.mainPage_cartScreen_name).tr(),
          body: Container(
            padding: const EdgeInsets.only(
              left: AppPadding.padding18,
              top: AppPadding.padding13,
              right: AppPadding.padding13,
              bottom: AppPadding.padding18,
            ),
            child: _content(state, theme, context),
          ),
        );
      },
    );
  }
}

Widget _content(
  CartState state,
  ThemeData theme,
  BuildContext context,
) {
  if (state.cartItems.isEmpty) {
    return Center(
      child: Text(
        LocaleKeys.mainPage_common_noProducts.tr(),
        style: theme.textTheme.headlineLarge,
      ),
    );
  } else {
    return Stack(
      children: <Widget>[
        ListView.separated(
          itemCount: state.cartItems.length,
          separatorBuilder: (_, __) => const SizedBox(
            height: AppSpacing.spacing11,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CartItem(
              cartItem: state.cartItems[index],
              onPlusTap: () {
                context
                    .read<CartBloc>()
                    .add(AddCartItemEvent(state.cartItems[index]));
              },
              onMinusTap: () {
                context
                    .read<CartBloc>()
                    .add(DeleteCartItemEvent(state.cartItems[index]));
              },
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: AppButton(
            height: AppSize.size45,
            width: double.infinity,
            onPressed: () {
              context.read<CartBloc>().add(DeleteAllCartItemsEvent());
            },
            child: Text(
              LocaleKeys.mainPage_cartScreen_clearCart.tr(),
            ),
          ),
        ),
      ],
    );
  }
}
