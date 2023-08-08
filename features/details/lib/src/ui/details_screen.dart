import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:details/src/ui/text_label.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  final ProductModel product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          toolbarHeight: 65,
          title: Text(product.name.capitalizeEveryWord()),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.red,
            ),
            //replace with our own icon data.
          ),
        ),
        body: Container(
          color: AppColors.blueLight,
          padding: const EdgeInsets.all(18),
          child: Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 65),
                      child: Column(
                        children: [
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
                                  child: Text('${product.cost}\$',
                                      style: textTheme.headlineMedium
                                          ?.copyWith(color: AppColors.white)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text('\t\t\t${product.description}',
                              style: textTheme.bodyLarge),
                          const SizedBox(
                            height: 15,
                          ),
                          const Divider(
                            indent: 20,
                            endIndent: 20,
                            color: AppColors.red,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Wrap(
                              spacing: 8.0, // gap between adjacent chips
                              runSpacing: 4.0, // gap between lines
                              children: List<Widget>.generate(
                                product.ingredients
                                    .length, // place the length of the array here
                                (int index) {
                                  return TextLabel(product.ingredients[index]);
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
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => (null),
                        child: Container(
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.red,
                          ),
                          child: const Icon(
                            Icons.add_rounded,
                            size: 30,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    )
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
