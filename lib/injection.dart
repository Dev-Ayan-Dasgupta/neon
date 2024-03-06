import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:neon_student/data/datasources/login_datasource.dart';
import 'package:neon_student/data/repositories/login_repository_impl.dart';
import 'package:neon_student/domain/repositories/login_repository.dart';
import 'package:neon_student/domain/usecases/get_login_details.dart';
import 'package:neon_student/presentation/bloc/index.dart';
import 'package:neon_student/presentation/bloc/toggleListItems/toggle_listitems_bloc.dart';

final locator = GetIt.instance;

void init() {
  // ! bloc
  locator.registerFactory(() => CheckBoxBloc());
  locator.registerFactory(() => ShowHideBloc());
  locator.registerFactory(() => LoginBloc(locator()));
  locator.registerFactory(() => ToggleListitemsBloc([]));

  // ! usecase
  locator.registerLazySingleton(() => GetLoginDetails(locator()));

  // ! repository
  locator.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginDataSource: locator()));

  // ! data source
  locator.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImpl(client: locator()));

  // ! external
  locator.registerLazySingleton(() => http.Client());
}
