import 'package:cart/src/ui/widgets/cart_item.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/cart/cart_bloc.dart';

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
    final CartBloc bloc = context.read<CartBloc>();

    return BlocBuilder<CartBloc, CartState>(
      builder: (
        BuildContext context,
        CartState state,
      ) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 65,
            title: const Text(LocaleKeys.mainPage_cartScreen_name).tr(),
          ),
          body: Container(
            padding: const EdgeInsets.only(
              left: 18,
              top: 13,
              right: 13,
              bottom: 18,
            ),
            child: ListView.separated(
              itemCount: state.cartItems.length,
              separatorBuilder: (_, __) => const SizedBox(height: 11),
              itemBuilder: (BuildContext context, int index) {
                return CartItem(cartItem: state.cartItems[index]);
              },
            ),
          ),
        );
      },
    );
  }
}
