


import 'dart:async';

enum Behavior{
  tap,
  drag,
}

class UserBehaviorDetector {

  final StreamController<Behavior> _streamController = StreamController.broadcast();

  Stream<Behavior> get stream => _streamController.stream;

  doSomething(Behavior behavior){
    _streamController.sink.add(behavior);
  }

}