// ignore_for_file: prefer_final_fields, unused_field

import 'dart:async';
import './counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _streamController = StreamController<int>();

  StreamSink<int> get _inCounter => _streamController.sink;
  Stream<int> get outCounter => _streamController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _streamController.close();
  }
}
