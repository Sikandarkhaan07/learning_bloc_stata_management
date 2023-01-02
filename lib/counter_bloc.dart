// ignore_for_file: prefer_final_fields, unused_field, depend_on_referenced_packages

import 'dart:async';
import 'package:bloc/bloc.dart';
import './counter_event.dart';
import './counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(super.initialState);

  @override
  Stream<CounterState> mapEventToState(
      CounterState state, CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield state..counter += 1;
    } else if (event is DecrementEvent) {
      yield state..counter -= 1;
    }
  }
}
