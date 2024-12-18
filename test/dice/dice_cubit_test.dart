import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hello_world/dice/dice_cubit.dart';

void main() {
  late DiceCubit diceCubit;

  group('DiceCubit', () {
    setUp(() async {
      diceCubit = DiceCubit();
    });

    test('initial state is correct', () {
      expect(diceCubit.state, null);
    });

    blocTest<DiceCubit, int?>(
      'should roll the dice and not be null',
      build: () => diceCubit,
      act: (cubit) => cubit.roll(),
      expect: () => isNot(null),
    );
  });
}
