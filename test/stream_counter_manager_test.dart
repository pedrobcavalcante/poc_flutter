import 'package:async/async.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:poc_flutter/features/counters/presentation/streams/stream_counter_manager.dart';

void main() {
  late StreamCounterManager manager;

  setUp(() {
    manager = StreamCounterManager();
  });

  tearDown(() {
    manager.dispose();
  });

  test('Valores iniciais devem ser 0', () {
    expect(manager.counterA, 0);
    expect(manager.counterB, 0);
  });

  test('incrementA emite novo valor', () async {
    // Cria uma fila para captar as emissões que ocorrerem depois da inscrição.
    final queue = StreamQueue(manager.counterAStream);
    manager.incrementA(); // _counterA passa de 0 para 1 e emite 1.
    final event = await queue.next;
    expect(event, equals(1));
    await queue.cancel();
  });

  test('decrementA emite novo valor', () async {
    // Primeiro, garantimos que haja algo para decrementar.
    manager.incrementA(); // counterA: 0 -> 1.
    final queue = StreamQueue(manager.counterAStream);
    manager.decrementA(); // counterA: 1 -> 0.
    final event = await queue.next;
    expect(event, equals(0));
    await queue.cancel();
  });

  test('incrementB emite novo valor', () async {
    final queue = StreamQueue(manager.counterBStream);
    manager.incrementB(); // counterB: 0 -> 1.
    final event = await queue.next;
    expect(event, equals(1));
    await queue.cancel();
  });

  test('decrementB não deixa ficar negativo', () async {
    final queue = StreamQueue(manager.counterBStream);
    manager.decrementB(); // counterB já é 0, permanece 0.
    final event = await queue.next;
    expect(event, equals(0));
    await queue.cancel();
  });

  test('incrementB e depois decrementB emitem valores corretos', () async {
    final queue = StreamQueue(manager.counterBStream);
    manager.incrementB(); // counterB: 0 -> 1.
    manager.incrementB(); // counterB: 1 -> 2.
    manager.decrementB(); // counterB: 2 -> 1.
    final event1 = await queue.next; // Deve capturar 1.
    final event2 = await queue.next; // Depois 2.
    final event3 = await queue.next; // E então 1.
    expect(event1, equals(1));
    expect(event2, equals(2));
    expect(event3, equals(1));
    await queue.cancel();
  });
}
