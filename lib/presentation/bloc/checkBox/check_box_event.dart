part of 'check_box_bloc.dart';

sealed class CheckBoxEvent extends Equatable {
  const CheckBoxEvent();

  @override
  List<Object> get props => [];
}

final class CheckBoxOnEvent extends CheckBoxEvent {}

final class CheckBoxOffEvent extends CheckBoxEvent {}

final class CheckBoxToggleEvent extends CheckBoxEvent {}
