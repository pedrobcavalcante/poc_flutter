import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/counter_controller.dart';

class GetXCounterScreen extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  GetXCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX em Ação')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Counter A (normal):', style: TextStyle(fontSize: 20)),
            Obx(() => Text('${controller.counterA.value}',
                style: const TextStyle(fontSize: 36))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: controller.incrementA, child: const Text('+1')),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: controller.decrementA, child: const Text('-1')),
              ],
            ),
            const SizedBox(height: 40),
            const Text('Counter B (não negativo):',
                style: TextStyle(fontSize: 20)),
            Obx(() => Text('${controller.counterB.value}',
                style: const TextStyle(fontSize: 36))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: controller.incrementB, child: const Text('+1')),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: controller.decrementB, child: const Text('-1')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
