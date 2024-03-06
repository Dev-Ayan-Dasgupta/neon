import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:neon_student/presentation/bloc/showHide/show_hide_bloc.dart';

void main() {
  group('ShowHideBloc Tests', () {
    blocTest(
      'Initially return an empty list of ShowHideState',
      build: () => ShowHideBloc(),
      expect: () => [],
    );

    blocTest(
      'When first ShowHideToggle is triggered, [ShowState] is returned',
      build: () => ShowHideBloc(),
      act: (bloc) => bloc.add(ShowHideToggle()),
      expect: () => [const ShowState(isHide: false)],
    );

    blocTest(
      'When first ShowHideToggle is triggered, [ShowState, HideState] is returned',
      build: () => ShowHideBloc(),
      act: (bloc) => bloc
        ..add(ShowHideToggle())
        ..add(ShowHideToggle()),
      expect: () => [
        const ShowState(isHide: false),
        const HideState(isHide: true),
      ],
    );
  });
}
