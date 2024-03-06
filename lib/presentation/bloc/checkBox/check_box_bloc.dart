import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_box_event.dart';
part 'check_box_state.dart';

class CheckBoxBloc extends Bloc<CheckBoxEvent, CheckBoxState> {
  CheckBoxBloc() : super(const CheckBoxInitial(true)) {
    on<CheckBoxOnEvent>((event, emit) {});
    on<CheckBoxOffEvent>((event, emit) {});
    on<CheckBoxToggleEvent>((event, emit) {
      if (state is CheckBoxOffState) {
        emit(const CheckBoxOnState(true));
      } else {
        emit(const CheckBoxOffState(false));
      }
    });
  }
}
