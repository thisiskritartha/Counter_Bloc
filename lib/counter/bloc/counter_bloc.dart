import 'package:bloc_counter/counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(count: 0)) {
    on<CounterIncrementPressed>(
        (event, emit) => emit(CounterState(count: state.count + 1, isIncremented: true)));
    on<CounterDecrementPressed>(
        (event, emit) => emit(CounterState(count: state.count - 1, isIncremented: false)));
  }
}
