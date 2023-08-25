import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../entities/cart_item/cart_item_entity.dart';
import '../entities/product/product_entity.dart';
import '../providers/local/hive_provider.dart';
import '../providers/remote/api_provider.dart';
import '../repositories/cart_repository_impl.dart';
import '../repositories/products_repository_impl.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebaseOptions();
    _initFirebase();
    _initApiProvider();
    _initProducts();
    _initHive();
    _initHiveAdapters();
    _initHiveProvider();
    _initCart();
  }

  void _initFirebaseOptions() {
    appLocator.registerLazySingleton<FirebaseOptions>(
      () => DefaultFirebaseOptions.currentPlatform,
    );
  }

  void _initFirebase() {
    appLocator.registerSingletonAsync<FirebaseApp>(() async {
      final FirebaseOptions options = appLocator.get<FirebaseOptions>();
      return Firebase.initializeApp(
        options: options,
      );
    });
  }

  void _initApiProvider() {
    appLocator.registerLazySingleton<ApiProvider>(
      () => ApiProvider(
        database: FirebaseFirestore.instance,
      ),
    );
  }

  void _initProducts() {
    appLocator.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImpl(
        apiProvider: appLocator.get<ApiProvider>(),
      ),
    );

    appLocator.registerLazySingleton<FetchAllProductsUseCase>(
      () => FetchAllProductsUseCase(
        productsRepository: appLocator.get<ProductsRepository>(),
      ),
    );
  }

  Future<void> _initHive() async {
    await Hive.initFlutter();
  }

  void _initHiveAdapters() {
    Hive.registerAdapter<ProductEntity>(ProductEntityAdapter());
    Hive.registerAdapter<CartItemEntity>(CartItemEntityAdapter());
  }

  void _initHiveProvider() {
    appLocator.registerLazySingleton<HiveProvider>(
      () => HiveProvider(),
    );
  }

  void _initCart() async {
    appLocator.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(
        hiveProvider: appLocator.get<HiveProvider>(),
      ),
    );

    appLocator.registerLazySingleton<AddCartItemToStorageUseCase>(
      () => AddCartItemToStorageUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<DeleteCartItemFromStorageUseCase>(
      () => DeleteCartItemFromStorageUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GetAllCartItemsFromStorageUseCase>(
      () => GetAllCartItemsFromStorageUseCase(
        cartRepository: appLocator.get<CartRepository>(),
      ),
    );
  }
}
