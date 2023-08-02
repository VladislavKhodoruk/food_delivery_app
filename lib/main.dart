import 'package:core/di/app_di.dart';
import 'package:data/di/data_di.dart';
import 'package:flutter/material.dart';
import 'app/food_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  appDI.initDependencies();
  dataDI.initDependencies();
  await appLocator.allReady();
  runApp(const FoodApp());
}
