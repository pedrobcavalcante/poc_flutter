import 'package:flutter_test/flutter_test.dart';

import 'package:poc_flutter/features/counters/presentation/controllers/counter_controller.dart';

void main() {
  group('CounterController (GetX)', () {
    late CounterController controller;

    setUp(() {
      controller = CounterController();
    });

    test('Valores iniciais devem ser 0', () {
      expect(controller.counterA.value, 0);
      expect(controller.counterB.value, 0);
    });

    test('incrementA aumenta counterA', () {
      controller.incrementA();
      expect(controller.counterA.value, 1);
    });

    test('decrementA diminui counterA', () {
      controller.decrementA();
      expect(controller.counterA.value, -1);
    });

    test('incrementB aumenta counterB', () {
      controller.incrementB();
      expect(controller.counterB.value, 1);
    });

    test('decrementB não deixa counterB ficar negativo', () {
      // Como counterB inicia em 0, decrementar não deve mudar o valor
      controller.decrementB();
      expect(controller.counterB.value, 0);
    });

    test('incrementB e depois decrementB ajusta counterB corretamente', () {
      controller.incrementB();
      controller.incrementB();
      controller.decrementB();
      expect(controller.counterB.value, 1);
    });
  });
}
