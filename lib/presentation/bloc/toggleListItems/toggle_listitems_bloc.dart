import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'toggle_listitems_event.dart';
part 'toggle_listitems_state.dart';

class ToggleListitemsBloc
    extends Bloc<ToggleListitemsEvent, ToggleListitemsState> {
  // final List<bool> toggleList;
  ToggleListitemsBloc(List<bool> initList)
      : super(ToggleListitemsState(toggleList: initList)) {
    on<ToggleListitem>((event, emit) {
      log("Togle List Before -> ${state.toggleList}");
      final selectedBoolIndex = event.isCheckedIndex;
      final currentList = state.toggleList;

      // final selectedBoolIndex = currentList.indexOf(selectedBool);
      log("selectedBoolIndex -> $selectedBoolIndex");

      if (selectedBoolIndex > -1) {
        bool isChecked = !(state.toggleList[selectedBoolIndex]);
        currentList[selectedBoolIndex] = isChecked;

        emit(ToggleListitemsState(toggleList: currentList));
        log("Togle List After -> ${state.toggleList}");
      }
    });
  }
}
