// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'toggle_listitems_bloc.dart';

abstract class ToggleListitemsEvent extends Equatable {
  const ToggleListitemsEvent();

  @override
  List<Object> get props => [];
}

class ToggleListitem extends ToggleListitemsEvent {
  final int isCheckedIndex;
  const ToggleListitem(this.isCheckedIndex);

  @override
  List<Object> get props => [isCheckedIndex];
}
