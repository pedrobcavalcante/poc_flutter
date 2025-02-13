import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:poc_flutter/features/counters/presentation/pages/bloc_counter_screen.dart';
import 'package:poc_flutter/features/counters/presentation/pages/getx_counter_screen.dart';
import 'package:poc_flutter/features/counters/presentation/pages/home_screen.dart';
import 'package:poc_flutter/features/counters/presentation/pages/stream_counter_screen.dart';

import 'package:poc_flutter/routes/app_routes.dart';

void main() {
  group('HomeScreen', () {
    setUp(() {
      Get.reset();
    });

    testWidgets('deve renderizar todos os botões corretamente', (tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: HomeScreen.route,
          getPages: AppRoutes.routes,
        ),
      );

      expect(find.text('Exemplo com Streams'), findsOneWidget);
      expect(find.text('Exemplo com BLoC'), findsOneWidget);
      expect(find.text('Exemplo com GetX'), findsOneWidget);
    });

    testWidgets('deve navegar para StreamCounterScreen ao clicar no botão',
        (tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: HomeScreen.route,
          getPages: AppRoutes.routes,
        ),
      );

      await tester.tap(find.text('Exemplo com Streams'));
      await tester.pumpAndSettle();

      expect(Get.currentRoute, StreamCounterScreen.route);
    });

    testWidgets('deve navegar para BlocCounterScreen ao clicar no botão',
        (tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: HomeScreen.route,
          getPages: AppRoutes.routes,
        ),
      );

      await tester.tap(find.text('Exemplo com BLoC'));
      await tester.pumpAndSettle();

      expect(Get.currentRoute, BlocCounterScreen.route);
    });

    testWidgets('deve navegar para GetXCounterScreen ao clicar no botão',
        (tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: HomeScreen.route,
          getPages: AppRoutes.routes,
        ),
      );

      await tester.tap(find.text('Exemplo com GetX'));
      await tester.pumpAndSettle();

      expect(Get.currentRoute, GetXCounterScreen.route);
    });

    testWidgets('deve mostrar o título correto na AppBar', (tester) async {
      await tester.pumpWidget(
        GetMaterialApp(
          initialRoute: HomeScreen.route,
          getPages: AppRoutes.routes,
        ),
      );

      expect(find.text('Escolha o Gerenciador de Estado'), findsOneWidget);
    });
  });
}
