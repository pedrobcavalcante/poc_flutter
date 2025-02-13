import 'package:get/get.dart';
import 'package:poc_flutter/features/counters/presentation/bloc/counter_bloc.dart';
import 'package:poc_flutter/features/counters/presentation/controllers/counter_controller.dart';
import 'package:poc_flutter/features/counters/presentation/streams/stream_counter_manager.dart';
import 'package:poc_flutter/features/data/datasources/api_datasource.dart';
import 'package:poc_flutter/features/data/repositories/api_repository_impl.dart';
import 'package:poc_flutter/features/domain/usecases/get_data_usecase.dart';
import 'package:poc_flutter/features/domain/usecases/post_data_usecase.dart';
import 'package:poc_flutter/features/presentation/controllers/api_controller.dart';

import 'features/domain/repositories/api_repository.dart';

class PocBinding extends Bindings {
  @override
  void dependencies() {
    // BLoC binding
    Get.lazyPut<CounterBloc>(() => CounterBloc());

    // GetX Controller binding
    Get.lazyPut<CounterController>(() => CounterController());

    // Stream Manager binding
    Get.lazyPut<StreamCounterManager>(() => StreamCounterManager());

    // Datasource
    Get.lazyPut<IApiDatasource>(() => ApiDatasource());

    // Repository
    Get.lazyPut<IApiRepository>(() => ApiRepositoryImpl(Get.find()));

    // Use Cases
    Get.lazyPut(() => GetDataUseCase(Get.find()));
    Get.lazyPut(() => PostDataUseCase(Get.find()));

    // Controller
    Get.lazyPut(() => ApiController(Get.find(), Get.find()));
  }
}
