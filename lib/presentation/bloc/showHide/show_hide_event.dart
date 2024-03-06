part of 'show_hide_bloc.dart';

abstract class ShowHideEvent extends Equatable {
  const ShowHideEvent();

  @override
  List<Object> get props => [];
}

final class ShowHideToggle extends ShowHideEvent {}
