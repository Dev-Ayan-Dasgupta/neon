import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:neon_student/data/models/login_model.dart';
import 'package:neon_student/domain/entities/login.dart';

import '../../helpers/json_reader.dart';

void main() {
  const tLoginModel = LoginModel(
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

  group('to Entity', () {
    test('should be a subclass of weather entity', () async {
      // Assert
      final result = tLoginModel.toEntity();
      expect(result, tLogin);
    });
  });

  group('from json', () {
    test('should return a valid model from json', () async {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummyData/login_response.json'),
      );

      // Act
      final result = LoginModel.fromMap(jsonMap);

      // Assert
      expect(result, tLoginModel);
    });
  });

  group('to json', () {
    test('should return a valid json from model', () async {
      // Arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helpers/dummyData/login_response.json'),
      );

      // Act
      final result = tLoginModel.toMap();

      // Assert
      expect(result, jsonMap);
    });
  });
}
