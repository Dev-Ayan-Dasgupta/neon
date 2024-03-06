import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_student/data/failure.dart';
import 'package:neon_student/domain/entities/login.dart';
import 'package:neon_student/presentation/bloc/index.dart';
import 'package:neon_student/utils/helpers/index.dart';

import '../../helpers/test_helper.dart';

void main() async {
  await dotenv.load(fileName: '.env.dev');
  late MockGetLoginDetails mockGetLoginDetails;
  late LoginBloc loginBloc;

  setUp(() {
    mockGetLoginDetails = MockGetLoginDetails();
    loginBloc = LoginBloc(mockGetLoginDetails);
  });

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

  test('initial state should be empty', () {
    expect(loginBloc.state, LoginInitial());
  });

  blocTest<LoginBloc, LoginState>(
    'should emit [loading, success] when data is gotten successfully',
    build: () {
      when(() => mockGetLoginDetails.execute(tLoginRequest))
          .thenAnswer((_) async => const Right(tLogin));
      return loginBloc;
    },
    act: (bloc) => loginBloc.add(LoginAttempt(loginRequest: tLoginRequest)),
    wait: const Duration(seconds: 5),
    expect: () => [LoginLoading(), const LoginSuccess(tLogin)],
    verify: (bloc) => verify(() => mockGetLoginDetails.execute(tLoginRequest)),
  );

  blocTest<LoginBloc, LoginState>(
    'should emit [loading, error] when data is unsuccessful',
    build: () {
      when(() => mockGetLoginDetails.execute(tLoginRequest))
          .thenAnswer((_) async => const Left(ServerFailure('Server failure')));
      return loginBloc;
    },
    act: (bloc) => loginBloc.add(LoginAttempt(loginRequest: tLoginRequest)),
    wait: const Duration(seconds: 5),
    expect: () => [LoginLoading(), const LoginError('Server failure')],
    verify: (bloc) => verify(() => mockGetLoginDetails.execute(tLoginRequest)),
  );
}
