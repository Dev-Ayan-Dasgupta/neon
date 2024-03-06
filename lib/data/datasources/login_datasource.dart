import 'dart:convert';
import 'dart:developer';

import 'package:neon_student/data/exception.dart';
import 'package:neon_student/data/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:neon_student/utils/constants/index.dart';

abstract class LoginDataSource {
  Future<LoginModel> getLoginData(Map<String, dynamic> loginRequest);
}

class LoginDataSourceImpl implements LoginDataSource {
  final http.Client client;

  LoginDataSourceImpl({required this.client});

  @override
  Future<LoginModel> getLoginData(Map<String, dynamic> loginRequest) async {
    final response = await client.post(
      Uri.parse(Environment.login),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginRequest),
    );

    log("Login API Status Code -> ${response.statusCode}");
    log("Login API Response -> ${json.decode(response.body)}");

    if (response.statusCode == 200) {
      return LoginModel.fromMap(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
