import 'dart:async';

class StreamCounterManager {
  int _counterA = 0;
  int _counterB = 0;

  final StreamController<int> _streamControllerA =
      StreamController<int>.broadcast();
  final StreamController<int> _streamControllerB =
      StreamController<int>.broadcast();

  // Expondo os streams para a UI
  Stream<int> get counterAStream => _streamControllerA.stream;
  Stream<int> get counterBStream => _streamControllerB.stream;

  // Expondo os valores atuais, caso precise para inicialData
  int get counterA => _counterA;
  int get counterB => _counterB;

  StreamCounterManager() {
    // Emite os valores iniciais
    _streamControllerA.sink.add(_counterA);
    _streamControllerB.sink.add(_counterB);
  }

  void incrementA() {
    _counterA++;
    _streamControllerA.sink.add(_counterA);
  }

  void decrementA() {
    _counterA--;
    _streamControllerA.sink.add(_counterA);
  }

  void incrementB() {
    _counterB++;
    _streamControllerB.sink.add(_counterB);
  }

  void decrementB() {
    if (_counterB > 0) _counterB--;
    _streamControllerB.sink.add(_counterB);
  }

  void dispose() {
    _streamControllerA.close();
    _streamControllerB.close();
  }
}
