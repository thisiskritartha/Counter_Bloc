import 'package:bloc_counter/counter/bloc/counter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterBloc', () {
    CounterBloc? counterBloc;

    setUp(() => counterBloc = CounterBloc());

    tearDown(() => counterBloc?.close());

    test("The initial state for the counter bloc is counterState(count:0)", () {
      expect(counterBloc?.state, const CounterState(count: 0));
    });

    blocTest<CounterBloc, CounterState>(
      'Emits [CounterState(count: 1, isIncremented: true] when counter incremented pressed.',
      build: () => CounterBloc(),
      act: (bloc) {
        bloc.add(CounterIncrementPressed());
      },
      expect: () => <CounterState>[
        const CounterState(count: 1, isIncremented: true),
      ],
    );

    blocTest(
      "Emit [CounterState(count: -1, isIncremented: false) when counter decremented pressed",
      build: () => CounterBloc(),
      act: (bloc) {
        bloc.add(CounterDecrementPressed());
      },
      expect: () => <CounterState>[const CounterState(count: -1, isIncremented: false)],
    );
  });
}
