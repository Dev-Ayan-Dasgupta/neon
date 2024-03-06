import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:neon_student/domain/entities/login.dart';
import 'package:neon_student/domain/usecases/get_login_details.dart';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetLoginDetails _getLoginDetails;

  LoginBloc(this._getLoginDetails) : super(LoginInitial()) {
    on<LoginAttempt>((event, emit) async {
      final loginRequest = event.loginRequest;

      emit(LoginLoading());

      final result = await _getLoginDetails.execute(loginRequest);
      result.fold(
        (failure) {
          emit(LoginError(failure.message));
        },
        (data) {
          emit(LoginSuccess(data));
        },
      );
    }, transformer: debounce(const Duration(milliseconds: 250)));
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
