import 'package:equatable/equatable.dart';

class Routes extends Equatable {
  static const String login = '/';
  static const String checkout = 'checkout';
  static const String dashboard = 'dashboard';

  @override
  List<Object?> get props => [login, checkout, dashboard];
}
