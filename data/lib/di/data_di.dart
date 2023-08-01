import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/config/firebase_options.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/repositories/products_repository.dart';
import 'package:domain/usecases/fetch_products_usecase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:data/providers/api_provider.dart';
import 'package:data/repositories/products_repository_impl.dart';

final DataDI dataDI = DataDI();

class DataDI {
  Future<void> initDependencies() async {
    _initFirebaseOptions();
    _initFirebase();
    _initApiProvider();
    _initProducts();
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
}
