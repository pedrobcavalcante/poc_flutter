import 'package:flutter/material.dart';
import '../streams/stream_counter_manager.dart';

class StreamCounterScreen extends StatefulWidget {
  static const String route = '/stream-counter';
  const StreamCounterScreen({super.key});

  @override
  StreamCounterScreenState createState() => StreamCounterScreenState();
}

class StreamCounterScreenState extends State<StreamCounterScreen> {
  // Instância do nosso gerenciador de estado via streams
  final StreamCounterManager _manager = StreamCounterManager();

  @override
  void dispose() {
    _manager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streams em Ação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Counter A (normal):', style: TextStyle(fontSize: 20)),
            StreamBuilder<int>(
              stream: _manager.counterAStream,
              initialData: _manager.counterA,
              builder: (context, snapshot) {
                return Text('${snapshot.data}',
                    style: const TextStyle(fontSize: 36));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _manager.incrementA, child: const Text('+1')),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: _manager.decrementA, child: const Text('-1')),
              ],
            ),
            const SizedBox(height: 40),
            const Text('Counter B (não negativo):',
                style: TextStyle(fontSize: 20)),
            StreamBuilder<int>(
              stream: _manager.counterBStream,
              initialData: _manager.counterB,
              builder: (context, snapshot) {
                return Text('${snapshot.data}',
                    style: const TextStyle(fontSize: 36));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: _manager.incrementB, child: const Text('+1')),
                const SizedBox(width: 10),
                ElevatedButton(
                    onPressed: _manager.decrementB, child: const Text('-1')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
