import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_student/data/exception.dart';
import 'package:neon_student/data/failure.dart';
import 'package:neon_student/data/models/login_model.dart';
import 'package:neon_student/data/repositories/login_repository_impl.dart';
import 'package:neon_student/domain/entities/login.dart';
import 'package:neon_student/utils/helpers/encrypt_decrypt.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.dart';

void main() async {
  await dotenv.load(fileName: '.env.dev');
  late MockLoginDataSource mockLoginDataSource;
  late LoginRepositoryImpl loginRepositoryImpl;

  setUp(() {
    mockLoginDataSource = MockLoginDataSource();
    loginRepositoryImpl =
        LoginRepositoryImpl(loginDataSource: mockLoginDataSource);
  });

  final tLoginModel = LoginModel.fromMap(
      json.decode(readJson('helpers/dummyData/login_response.json')));

  const tLogin = Login(
    emailId: 'test6@gmail.com',
    customerName: 'Ghassan Mohamad Sami Nusair',
    isOnboardingComplete: true,
    onboardingState: 8,
    cif: 'GA000148',
    corporateReference: null,
    token: 'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9',
    reason: null,
    reasonCode: 0,
    tokenExpiresOn: '2023-12-24T07:02:03Z',
    kycExpiresOn: '2033-03-14T00:00:00',
    isTemporaryPassword: false,
    passwordChangesToday: 0,
    emailChangesToday: 0,
    mobileChangesToday: 0,
    success: true,
    message: null,
  );

  group(
    'get login data',
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

      test(
        'should return login details when a call to data source is successful',
        () async {
          // Arrange
          when(() => mockLoginDataSource.getLoginData(tLoginRequest))
              .thenAnswer((_) async => tLoginModel);

          // Act
          final result = await loginRepositoryImpl.login(tLoginRequest);

          // Assert
          verify(() => mockLoginDataSource.getLoginData(tLoginRequest));
          expect(result, const Right(tLogin));
        },
      );

      test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
          // Arrange
          when(() => mockLoginDataSource.getLoginData(tLoginRequest))
              .thenThrow(ServerException());

          // Act
          final result = await loginRepositoryImpl.login(tLoginRequest);

          // Assert
          verify(() => mockLoginDataSource.getLoginData(tLoginRequest));
          expect(result, const Left(ServerFailure('Server Failure')));
        },
      );

      test(
        'should return connection failure when the device has no internet',
        () async {
          // Arrange
          when(() => mockLoginDataSource.getLoginData(tLoginRequest)).thenThrow(
              const SocketException('Failed to connect to the network'));

          // Act
          final result = await loginRepositoryImpl.login(tLoginRequest);

          // Assert
          verify(() => mockLoginDataSource.getLoginData(tLoginRequest));
          expect(
            result,
            const Left(ConnectionFailure('Failed to connect to the network')),
          );
        },
      );
    },
  );
}
