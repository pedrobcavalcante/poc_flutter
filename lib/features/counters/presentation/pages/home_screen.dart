import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'stream_counter_screen.dart';
import 'bloc_counter_screen.dart';
import 'getx_counter_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String route = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha o Gerenciador de Estado'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Exemplo com Streams'),
              onPressed: () => Get.toNamed(StreamCounterScreen.route),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Exemplo com BLoC'),
              onPressed: () => Get.toNamed(BlocCounterScreen.route),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Exemplo com GetX'),
              onPressed: () => Get.toNamed(GetXCounterScreen.route),
            ),
          ],
        ),
      ),
    );
  }
}
