import 'package:dartz/dartz.dart';
import 'package:neon_student/data/failure.dart';
import 'package:neon_student/domain/entities/login.dart';

abstract class LoginRepository {
  Future<Either<Failure, Login>> login(Map<String, dynamic> loginRequest);
}
