import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_student/domain/entities/login.dart';
import 'package:neon_student/domain/usecases/get_login_details.dart';
import 'package:neon_student/utils/helpers/index.dart';

import '../../helpers/test_helper.dart';

void main() async {
  await dotenv.load(fileName: '.env.dev');
  late MockLoginRepository mockLoginRepository;
  late GetLoginDetails usecase;

  setUp(() {
    mockLoginRepository = MockLoginRepository();
    usecase = GetLoginDetails(mockLoginRepository);
  });

  const tLoginDetail = Login(
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

  test('''Given: Login API,
        When: proper input is given,
        Then: login details are fetched from the repository
      ''', () async {
    // Arrange
    when(() => mockLoginRepository.login(tLoginRequest))
        .thenAnswer((_) async => const Right(tLoginDetail));

    // Act
    final result = await usecase.execute(tLoginRequest);

    // Assert
    expect(result, equals(const Right(tLoginDetail)));
  });
}
