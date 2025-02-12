import 'package:flutter_bloc/flutter_bloc.dart';

/// Eventos dos contadores
abstract class CounterEvent {}

class IncrementA extends CounterEvent {}

class DecrementA extends CounterEvent {}

class IncrementB extends CounterEvent {}

class DecrementB extends CounterEvent {}

/// Estado que mantém os dois contadores
class CounterState {
  final int counterA;
  final int counterB;

  CounterState({required this.counterA, required this.counterB});

  CounterState copyWith({int? counterA, int? counterB}) {
    return CounterState(
      counterA: counterA ?? this.counterA,
      counterB: counterB ?? this.counterB,
    );
  }
}

/// BLoC que gerencia os eventos e estados dos contadores
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterA: 0, counterB: 0)) {
    on<IncrementA>((event, emit) {
      emit(state.copyWith(counterA: state.counterA + 1));
    });
    on<DecrementA>((event, emit) {
      emit(state.copyWith(counterA: state.counterA - 1));
    });
    on<IncrementB>((event, emit) {
      emit(state.copyWith(counterB: state.counterB + 1));
    });
    on<DecrementB>((event, emit) {
      int newCounterB =
          state.counterB > 0 ? state.counterB - 1 : state.counterB;
      emit(state.copyWith(counterB: newCounterB));
    });
  }
}
