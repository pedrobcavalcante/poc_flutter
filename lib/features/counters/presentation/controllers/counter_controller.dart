import 'package:get/get.dart';

class CounterController extends GetxController {
  var counterA = 0.obs;
  var counterB = 0.obs;

  void incrementA() => counterA++;
  void decrementA() => counterA--;

  void incrementB() => counterB++;
  void decrementB() {
    if (counterB.value > 0) counterB--;
  }
}
