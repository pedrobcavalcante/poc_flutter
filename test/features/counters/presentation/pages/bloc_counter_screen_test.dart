import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_flutter/features/counters/presentation/pages/bloc_counter_screen.dart';

void main() {
  group('BlocCounterScreen', () {
    testWidgets('deve renderizar corretamente os contadores iniciais',
        (tester) async {
      await tester.pumpWidget(const MaterialApp(home: BlocCounterScreen()));

      expect(find.text('Counter A (normal):'), findsOneWidget);
      expect(find.text('Counter B (não negativo):'), findsOneWidget);
      expect(
          find.byWidgetPredicate(
              (widget) => widget is Text && widget.style?.fontSize == 36),
          findsNWidgets(2));
    });

    testWidgets('deve incrementar contador A corretamente', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: BlocCounterScreen()));

      await tester.tap(find.widgetWithText(ElevatedButton, '+1').first);
      await tester.pump();

      expect(
          find.byWidgetPredicate((widget) =>
              widget is Text &&
              widget.data == '1' &&
              widget.style?.fontSize == 36),
          findsOneWidget);
    });

    testWidgets('deve decrementar contador A corretamente', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: BlocCounterScreen()));

      await tester.tap(find.widgetWithText(ElevatedButton, '-1').first);
      await tester.pump();

      expect(
          find.byWidgetPredicate((widget) =>
              widget is Text &&
              widget.data == '-1' &&
              widget.style?.fontSize == 36),
          findsOneWidget);
    });
  });
}
