import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/features/counters/presentation/pages/home_screen.dart';
import 'package:poc_flutter/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialRoute: HomeScreen.route,
      getPages: AppRoutes.routes,
      home: const HomeScreen(),
    );
  }
}
