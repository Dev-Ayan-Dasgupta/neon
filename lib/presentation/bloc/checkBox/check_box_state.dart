part of 'check_box_bloc.dart';

sealed class CheckBoxState extends Equatable {
  const CheckBoxState({required this.isChecked});

  final bool isChecked;

  @override
  List<Object> get props => [isChecked];
}

final class CheckBoxInitial extends CheckBoxState {
  const CheckBoxInitial(bool isChecked) : super(isChecked: true);
}

final class CheckBoxOnState extends CheckBoxState {
  const CheckBoxOnState(bool isChecked) : super(isChecked: true);
}

final class CheckBoxOffState extends CheckBoxState {
  const CheckBoxOffState(bool isChecked) : super(isChecked: false);
}
