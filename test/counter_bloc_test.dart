import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_flutter/features/counters/presentation/bloc/counter_bloc.dart';

void main() {
  group('CounterBloc', () {
    blocTest<CounterBloc, CounterState>(
      'Ao adicionar IncrementA, deve emitir CounterState(counterA: 1, counterB: 0)',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(IncrementA()),
      expect: () => [CounterState(counterA: 1, counterB: 0)],
    );

    blocTest<CounterBloc, CounterState>(
      'Ao adicionar DecrementA, deve emitir CounterState(counterA: -1, counterB: 0)',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(DecrementA()),
      expect: () => [CounterState(counterA: -1, counterB: 0)],
    );

    blocTest<CounterBloc, CounterState>(
      'Ao adicionar IncrementB, deve emitir CounterState(counterA: 0, counterB: 1)',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(IncrementB()),
      expect: () => [CounterState(counterA: 0, counterB: 1)],
    );

    blocTest<CounterBloc, CounterState>(
      'Ao adicionar DecrementB com counterB = 0, deve permanecer em 0',
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(DecrementB()),
      expect: () => [CounterState(counterA: 0, counterB: 0)],
    );

    blocTest<CounterBloc, CounterState>(
      'Sequência de eventos: IncrementB, IncrementB e DecrementB',
      build: () => CounterBloc(),
      act: (bloc) {
        bloc.add(IncrementB()); // counterB: 0 -> 1
        bloc.add(IncrementB()); // counterB: 1 -> 2
        bloc.add(DecrementB()); // counterB: 2 -> 1
      },
      expect: () => [
        CounterState(counterA: 0, counterB: 1),
        CounterState(counterA: 0, counterB: 2),
        CounterState(counterA: 0, counterB: 1),
      ],
    );
  });
}
