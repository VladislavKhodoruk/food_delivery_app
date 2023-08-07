import 'package:core/core.dart';
import 'package:core/extensions/extensions.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/product/product_model.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  final ProductModel product;
  const DetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
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
            )),
        body: Container(
          color: AppColors.blueLight,
          child: Center(
            child: Text(product.name),
          ),
        ),
      ),
    );
  }
}
