import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:neon_student/data/datasources/login_datasource.dart';
import 'package:neon_student/data/exception.dart';
import 'package:neon_student/data/failure.dart';
import 'package:neon_student/domain/entities/login.dart';
import 'package:neon_student/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl({required this.loginDataSource});

  @override
  Future<Either<Failure, Login>> login(
      Map<String, dynamic> loginRequest) async {
    try {
      final result = await loginDataSource.getLoginData(loginRequest);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(ServerFailure('Server Failure'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
