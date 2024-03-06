part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final Login result;

  const LoginSuccess(this.result);

  @override
  List<Object> get props => [result];
}

final class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}
