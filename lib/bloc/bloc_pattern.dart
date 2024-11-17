import 'dart:async';

class bloc_pattern{
  final _stateStreamController = StreamController<String>();
  StreamSink<String> get nameSink => _stateStreamController.sink;
  Stream<String> get nameStream => _stateStreamController.stream;
}