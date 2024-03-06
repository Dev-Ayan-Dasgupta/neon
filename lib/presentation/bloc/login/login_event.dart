// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginAttempt extends LoginEvent {
  final Map<String, dynamic> loginRequest;

  const LoginAttempt({
    required this.loginRequest,
  });

  @override
  List<Object> get props => [loginRequest];
}
