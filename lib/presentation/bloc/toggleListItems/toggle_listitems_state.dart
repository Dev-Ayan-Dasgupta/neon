part of 'toggle_listitems_bloc.dart';

class ToggleListitemsState extends Equatable {
  const ToggleListitemsState({required this.toggleList});
  final List<bool> toggleList;

  @override
  List<Object> get props => [toggleList, identityHashCode(this)];
}
