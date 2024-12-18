import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/counter/counter_cubit.dart';

void main() {
  late CounterCubit counterCubit;

  group('CounterCubit', () {
    setUp(() async {
      counterCubit = CounterCubit();
    });

    test('initial state is correct', () {
      expect(counterCubit.state, 0);
    });

    blocTest<CounterCubit, int>(
      'should increment count when increment is called',
      build: () => counterCubit,
      act: (cubit) {
        cubit.increment();
        cubit.increment();
      },
      expect: () => <int>[1, 2],
    );

    blocTest<CounterCubit, int>(
      'should decrement count when decrement is called',
      build: () => counterCubit,
      act: (cubit) {
        cubit.decrement();
        cubit.decrement();
      },
      expect: () => <int>[-1, -2],
    );
  });
}
