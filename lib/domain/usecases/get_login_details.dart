import 'package:dartz/dartz.dart';
import 'package:neon_student/data/failure.dart';
import 'package:neon_student/domain/entities/login.dart';
import 'package:neon_student/domain/repositories/login_repository.dart';

class GetLoginDetails {
  final LoginRepository repository;

  GetLoginDetails(this.repository);

  Future<Either<Failure, Login>> execute(Map<String, dynamic> loginRequest) {
    return repository.login(loginRequest);
  }
}
