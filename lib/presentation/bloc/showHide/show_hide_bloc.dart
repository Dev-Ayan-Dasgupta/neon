import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_hide_event.dart';
part 'show_hide_state.dart';

class ShowHideBloc extends Bloc<ShowHideEvent, ShowHideState> {
  ShowHideBloc() : super(const ShowHideInitial(isHide: true)) {
    on<ShowHideToggle>((event, emit) {
      if (state is ShowHideInitial || state is HideState) {
        emit(const ShowState(isHide: false));
      } else {
        emit(const HideState(isHide: true));
      }
    });
  }
}
