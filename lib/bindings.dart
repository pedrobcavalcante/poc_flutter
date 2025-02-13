import 'package:get/get.dart';
import 'package:poc_flutter/features/counters/presentation/bloc/counter_bloc.dart';
import 'package:poc_flutter/features/counters/presentation/controllers/counter_controller.dart';
import 'package:poc_flutter/features/counters/presentation/streams/stream_counter_manager.dart';

class PocBinding extends Bindings {
  @override
  void dependencies() {
    // BLoC binding
    Get.lazyPut<CounterBloc>(() => CounterBloc());

    // GetX Controller binding
    Get.lazyPut<CounterController>(() => CounterController());

    // Stream Manager binding
    Get.lazyPut<StreamCounterManager>(() => StreamCounterManager());
  }
}
