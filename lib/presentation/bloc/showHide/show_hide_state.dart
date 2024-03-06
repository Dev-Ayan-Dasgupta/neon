part of 'show_hide_bloc.dart';

abstract class ShowHideState extends Equatable {
  const ShowHideState({required this.isHide});

  final bool isHide;

  @override
  List<Object> get props => [isHide];
}

final class ShowHideInitial extends ShowHideState {
  const ShowHideInitial({required super.isHide});
}

final class HideState extends ShowHideState {
  const HideState({required super.isHide});
}

final class ShowState extends ShowHideState {
  const ShowState({required super.isHide});
}
