import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:details/src/ui/widgets/text_label.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../bloc/details/details_bloc.dart';
import 'widgets/bottom_buttons.dart';

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
          child: AppScaffold(
            title: Text(state.cartItem.product.name.capitalizeEveryWord()),
            leading: IconButton(
              onPressed: () => context.router.pop(),
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: theme.colorScheme.primary,
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
                          padding: const EdgeInsets.only(
                            bottom: AppPadding.padding70,
                          ),
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                      AppBorderRadius.radius5,
                                    ),
                                    child: Image.network(
                                      state.cartItem.product.image,
                                    ),
                                  ),
                                  Positioned(
                                    top: AppSpacing.spacing10,
                                    right: AppSpacing.spacing10,
                                    child: TransparentLabel(
                                      height: AppSize.size30,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: AppPadding.padding5,
                                      ),
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
                              const SizedBox(
                                height: AppSpacing.spacing15,
                              ),
                              Text(
                                '\t\t\t${state.cartItem.product.description}',
                                style: theme.textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                height: AppSpacing.spacing15,
                              ),
                              Divider(
                                indent: AppSpacing.spacing20,
                                endIndent: AppSpacing.spacing20,
                                color: theme.dividerColor,
                              ),
                              const SizedBox(height: AppSpacing.spacing15),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Wrap(
                                  spacing: AppSpacing.spacing8,
                                  runSpacing: AppSpacing.spacing4,
                                  children: List<Widget>.generate(
                                    state.cartItem.product.ingredients.length,
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
                    child: BottomButtons(
                      amount: state.cartItem.amount,
                      onPlusTap: () {
                        context.read<DetailsBloc>().add(AddItemEvent());
                      },
                      onMinusTap: () {
                        context.read<DetailsBloc>().add(DeleteItemEvent());
                      },
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
