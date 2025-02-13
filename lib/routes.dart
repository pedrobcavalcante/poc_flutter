import 'package:get/get.dart';
import 'package:poc_flutter/bindings.dart';
import 'package:poc_flutter/features/counters/presentation/pages/bloc_counter_screen.dart';
import 'package:poc_flutter/features/counters/presentation/pages/getx_counter_screen.dart';
import 'package:poc_flutter/features/counters/presentation/pages/home_screen.dart';
import 'package:poc_flutter/features/counters/presentation/pages/stream_counter_screen.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(
      name: HomeScreen.route,
      page: () => const HomeScreen(),
      binding: PocBinding(),
    ),
    GetPage(
      name: BlocCounterScreen.route,
      page: () => const BlocCounterScreen(),
      binding: PocBinding(),
    ),
    GetPage(
      name: GetXCounterScreen.route,
      page: () => GetXCounterScreen(),
      binding: PocBinding(),
    ),
    GetPage(
      name: StreamCounterScreen.route,
      page: () => const StreamCounterScreen(),
      binding: PocBinding(),
    ),
  ];
}
