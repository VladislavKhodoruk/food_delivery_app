import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery Application',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
