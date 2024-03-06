import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_student/data/datasources/login_datasource.dart';
import 'package:neon_student/data/exception.dart';
import 'package:neon_student/data/models/login_model.dart';
import 'package:neon_student/utils/constants/index.dart';
import 'package:neon_student/utils/helpers/index.dart';
import 'package:http/http.dart' as http;

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.dart';

void main() async {
  await dotenv.load(fileName: '.env.dev');
  late MockClient mockClient;
  late LoginDataSourceImpl loginDataSourceImpl;

  setUp(() {
    mockClient = MockClient();
    loginDataSourceImpl = LoginDataSourceImpl(client: mockClient);
  });

  group(
    'get login details',
    () {
      final tLoginRequest = {
        "emailId": "test6@gmail.com",
        "userTypeId": 1,
        "isUAEPass": false,
        "uaePassCode": "",
        "password": EncryptDecrypt.encrypt("Test@123"),
        "deviceId": "1AD8E712-1896-473F-94E6-306CD3A4B9B3",
        "registerDevice": false,
        "deviceName": "iPhone 14 Pro Max",
        "deviceType": "iOS",
        "appVersion": "1.0.0",
        "fcmToken": "",
      };

      final tLoginModel = LoginModel.fromMap(
          json.decode(readJson('helpers/dummyData/login_response.json')));

      test(
        'Should return LoginModel when status code is 200',
        () async {
          // Arrange
          when(
            () => mockClient.post(
              Uri.parse(Environment.login),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(tLoginRequest),
            ),
          ).thenAnswer(
            (_) async => http.Response(
                readJson('helpers/dummyData/login_response.json'), 200),
          );

          // Act
          final result = await loginDataSourceImpl.getLoginData(tLoginRequest);

          // Assert
          expect(result, tLoginModel);
        },
      );

      test(
        'should throw a server exception when the response code is 400',
        () async {
          // Arrange
          when(
            () => mockClient.post(
              Uri.parse(Environment.login),
              headers: {
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(tLoginRequest),
            ),
          ).thenAnswer(
            (_) async => http.Response(
                readJson('helpers/dummyData/login_400.json'), 400),
          );

          // Act
          final call = loginDataSourceImpl.getLoginData(tLoginRequest);

          // Assert
          expect(() => call, throwsA(isA<ServerException>()));
        },
      );
    },
  );
}
