import 'package:flutter/material.dart';
import 'features/counters/presentation/pages/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Management Show',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
