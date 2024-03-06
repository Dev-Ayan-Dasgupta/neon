import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_student/data/datasources/login_datasource.dart';
import 'package:neon_student/domain/repositories/login_repository.dart';
import 'package:neon_student/domain/usecases/get_login_details.dart';
import 'package:neon_student/presentation/bloc/index.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

class MockLoginDataSource extends Mock implements LoginDataSource {}

class MockGetLoginDetails extends Mock implements GetLoginDetails {}

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class FakeLoginState extends Fake implements LoginState {}

class FakeLoginEvent extends Fake implements LoginEvent {}

class MockShowHideBloc extends MockBloc<ShowHideEvent, ShowHideState>
    implements ShowHideBloc {}

class FakeShowHideState extends Fake implements ShowHideState {}

class FakeShowHideEvent extends Fake implements ShowHideEvent {}

class MockHttpClient extends Mock implements HttpClient {}

class MockClient extends Mock implements Client {}
