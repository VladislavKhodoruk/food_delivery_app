import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:details/src/ui/text_label.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  final ProductModel product;

  const DetailsScreen({
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          context.router.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          title: Text(product.name.capitalizeEveryWord()),
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
                                  product.image,
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: TransparentLabel(
                                  height: 30,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    '${product.cost}\$',
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
                            '\t\t\t${product.description}',
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
                                product.ingredients.length,
                                // place the length of the array here
                                (int index) {
                                  return TextLabel(
                                    product.ingredients[index],
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
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        //TODO: implement function
                        onTap: () => (),
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: theme.colorScheme.primary,
                          ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
