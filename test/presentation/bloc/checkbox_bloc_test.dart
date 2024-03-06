import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_student/presentation/bloc/checkBox/check_box_bloc.dart';

void main() {
  group('CheckBoxBloc Tests', () {
    blocTest(
      'Initially Checkbox will be checked',
      build: () => CheckBoxBloc(),
      expect: () => [],
    );
    blocTest<CheckBoxBloc, CheckBoxState>(
      'Checkbox will be unchecked after first CheckBoxToggleEvent',
      build: () => CheckBoxBloc(),
      act: (bloc) => bloc.add(CheckBoxToggleEvent()),
      expect: () => [const CheckBoxOffState(false)],
    );

    blocTest<CheckBoxBloc, CheckBoxState>(
      'Checkbox will be checked after two CheckBoxToggleEvents',
      build: () => CheckBoxBloc(),
      act: (bloc) => bloc
        ..add(CheckBoxToggleEvent())
        ..add(CheckBoxToggleEvent()),
      expect: () => [
        const CheckBoxOffState(false),
        const CheckBoxOnState(true),
      ],
    );
  });
}
