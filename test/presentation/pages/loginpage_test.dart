import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_student/domain/entities/login.dart';
import 'package:neon_student/domain/usecases/get_login_details.dart';

import 'package:neon_student/injection.dart' as di;
import 'package:neon_student/main.dart';
import 'package:neon_student/presentation/bloc/index.dart';
import 'package:neon_student/presentation/pages/index.dart';
import 'package:neon_student/presentation/widgets/core/index.dart';
import 'package:neon_student/presentation/widgets/core/loader_row.dart';
import 'package:neon_student/presentation/widgets/login_section.dart';
import 'package:neon_student/utils/constants/bloc_providers.dart';
import 'package:neon_student/utils/constants/index.dart';
import 'package:neon_student/utils/helpers/encrypt_decrypt.dart';

import 'package:http/http.dart' as http;

import '../../helpers/test_helper.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  // LiveTestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env.dev');
  late MockLoginBloc mockLoginBloc;
  late MockShowHideBloc mockShowHideBloc;

  setUpAll(() {
    di.init();
    HttpOverrides.global = null;
    registerFallbackValue(FakeLoginState());
    registerFallbackValue(FakeLoginEvent());
    registerFallbackValue(FakeShowHideState());
    registerFallbackValue(FakeShowHideEvent());

    // final di = GetIt.instance;
    GetIt.instance.registerFactory(() => mockLoginBloc);
    GetIt.instance.registerFactory(() => mockShowHideBloc);
  });

  setUp(() {
    mockLoginBloc = MockLoginBloc();
    mockShowHideBloc = MockShowHideBloc();
  });

  // Widget initialWidget = MultiBlocProvider(
  //   providers: BlocProviders.blocProviders,
  //   child: MaterialApp.router(
  //     routerConfig: GoRouteInformation.router,
  //   ),
  // );

  Widget makeTestableWidget(Widget body) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>.value(
          value: mockLoginBloc,
        ),
        BlocProvider<ShowHideBloc>.value(
          value: mockShowHideBloc,
        ),
        // BlocProvider(
        //   create: (context) => ShowHideBloc(),
        // ),
        BlocProvider(
          create: (context) => CheckBoxBloc(),
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

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

  testWidgets('Navigates from LoginPage to CheckoutPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());
    // await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    await tester.pumpWidget(
      MultiBlocProvider(
        providers: BlocProviders.blocProviders,
        child: MaterialApp.router(
          routerConfig: GoRouteInformation.router,
        ),
      ),
    );

    expect(find.byType(LoginSection), findsOneWidget);
    expect(find.byType(SplitDivider), findsOneWidget);

    Finder subscribeButton = find.byKey(const ValueKey('Subscribe'));
    expect(subscribeButton, findsOneWidget);

    await tester.tap(subscribeButton);
    await tester.pumpAndSettle();

    expect(find.byType(CheckoutPage), findsOneWidget);
  });

  testWidgets(
      'Login button should trigger state change from initial to loading',
      (tester) async {
    // Arrange
    when(() => mockLoginBloc.state).thenReturn(LoginInitial());

    // Act
    await tester.pumpWidget(const MainApp());
    // await tester.pumpWidget(initialWidget);
    await tester.pumpWidget(makeTestableWidget(const LoginPage()));

    await tester.enterText(
        find.byKey(const ValueKey('EmailAddress')), 'test6@gmail.com');
    await tester.enterText(find.byKey(const ValueKey('Password')), 'Test@123');

    await tester.tap(find.byKey(const ValueKey('Login')));
    await tester.pumpAndSettle();

    // Assert
    verify(() => mockLoginBloc.add(LoginAttempt(loginRequest: tLoginRequest)))
        .called(1);
    // expect(find.byType(DashboardPage), findsOneWidget);
  });

  testWidgets('Should show LoaderRow when state is loading', (tester) async {
    // Arrange
    when(() => mockLoginBloc.state).thenReturn(LoginLoading());

    // Act
    await tester.pumpWidget(const MainApp());
    // await tester.pumpWidget(initialWidget);
    await tester.pumpWidget(makeTestableWidget(const LoginPage()));

    /*
    await tester.enterText(
        find.byKey(const ValueKey('EmailAddress')), 'test6@gmail.com');
    await tester.enterText(find.byKey(const ValueKey('Password')), 'Test@123');

    expect(find.byKey(const ValueKey('Login')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('Login')));
    */

    // await tester.pumpAndSettle();
    // await tester.pump();
    // for (int i = 0; i < 5; i++) {
    //   await tester.pump(const Duration(seconds: 1));
    // }

    // Assert
    // verify(() => mockLoginBloc.add(LoginAttempt(loginRequest: tLoginRequest)))
    //     .called(1);
    expect(find.byType(LoaderRow), findsOneWidget);
  });

  testWidgets('Should show AlertDialog when state is error', (tester) async {
    // Arrange
    when(() => mockLoginBloc.state)
        .thenReturn(const LoginError('Server failure'));

    // Act
    await tester.pumpWidget(const MainApp());
    // await tester.pumpWidget(initialWidget);
    await tester.pumpWidget(makeTestableWidget(const LoginPage()));

    await tester.enterText(
        find.byKey(const ValueKey('EmailAddress')), 'test6@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('Password')), 'Test@12345');

    expect(find.byKey(const ValueKey('Login')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('Login')));

    await tester.pumpAndSettle();
    // await tester.pump();
    // for (int i = 0; i < 5; i++) {
    //   await tester.pump(const Duration(seconds: 1));
    // }

    // Assert
    // verify(() => mockLoginBloc.add(LoginAttempt(loginRequest: tLoginRequest)))
    //     .called(1);
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  testWidgets(
    'should navigate to DashboardPage when login data is fetched',
    (WidgetTester tester) async {
      // arrange
      when(() => mockLoginBloc.state).thenReturn(const LoginSuccess(tLogin));

      // act
      await tester.pumpWidget(const MainApp());
      // await tester.pumpWidget(initialWidget);
      await tester.pumpWidget(makeTestableWidget(const LoginPage()));
      await tester.runAsync(() async {
        // final HttpClient client = HttpClient();
        await http.post(
          Uri.parse(Environment.login),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(tLoginRequest),
        );
      });

      await tester.pumpAndSettle();

      // assert
      // verify(() => mockLoginBloc.add(LoginAttempt(loginRequest: tLoginRequest)))
      //     .called(1);
      expect(find.byType(DashboardPage), equals(findsOneWidget));
    },
  );

  group('ShowHideBloc related tests', () {
    setUp(() {});

    Widget makeTestableWidget2(Widget body) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LoginBloc(di.locator()),
          ),
          BlocProvider<ShowHideBloc>.value(
            value: mockShowHideBloc,
          ),
          BlocProvider(
            create: (context) => CheckBoxBloc(),
          ),
        ],
        child: MaterialApp(
          home: body,
        ),
      );
    }

    testWidgets('Hide icon should show, Show icon should be absent',
        (tester) async {
      // Arange
      when(() => mockShowHideBloc.state)
          .thenReturn(const ShowState(isHide: true));

      // Act
      await tester.pumpWidget(const MainApp());
      // await tester.pumpWidget(makeTestableWidget(const LoginPage()));
      await tester.pumpWidget(makeTestableWidget2(const LoginPage()));

      Finder showHideFinder = find.byKey(const ValueKey('ShowHide'));
      Finder hideIconFinder = find.byIcon(Icons.visibility_off_outlined);
      Finder showIconFinder = find.byIcon(Icons.visibility_outlined);

      // Assert
      expect(showHideFinder, findsOneWidget);
      expect(hideIconFinder, findsOneWidget);
      expect(showIconFinder, findsNothing);
    });

    testWidgets('Show icon should show, Hide icon should be absent',
        (tester) async {
      // Arange
      when(() => mockShowHideBloc.state)
          .thenReturn(const ShowState(isHide: false));

      // Act
      await tester.pumpWidget(const MainApp());
      // await tester.pumpWidget(makeTestableWidget(const LoginPage()));
      await tester.pumpWidget(makeTestableWidget2(const LoginPage()));

      Finder showHideFinder = find.byKey(const ValueKey('ShowHide'));
      Finder hideIconFinder = find.byIcon(Icons.visibility_off_outlined);
      Finder showIconFinder = find.byIcon(Icons.visibility_outlined);

      // Assert
      expect(showHideFinder, findsOneWidget);
      expect(hideIconFinder, findsNothing);
      expect(showIconFinder, findsOneWidget);
    });

    testWidgets('ShowHide toggle', (tester) async {
      // Arrange
      when(() => mockShowHideBloc.state).thenReturn(
        const HideState(isHide: true),
      );

      // Act
      await tester.pumpWidget(const MainApp());
      // await tester.pumpWidget(makeTestableWidget(const LoginPage()));
      await tester.pumpWidget(makeTestableWidget2(const LoginPage()));

      var gesture = await tester.startGesture(
          tester.getCenter(find.byKey(const ValueKey('ShowHide'))));
      await gesture.up();
      var gesture2 = await tester.createGesture();
      // await gesture2.down(downLocation);

      Finder showHideFinder = find.byKey(const ValueKey('ShowHide'));
      Finder hideIconFinder = find.byIcon(Icons.visibility_off_outlined);
      Finder showIconFinder = find.byIcon(Icons.visibility_outlined);

      // Assert
      expect(showHideFinder, findsOneWidget);
      expect(hideIconFinder, findsOneWidget);
      expect(showIconFinder, findsNothing);

      // Act
      await tester.tap(showHideFinder);
      // await tester.pumpAndSettle();
      await tester.pump();

      // Assert
      verify(() => mockShowHideBloc.add(ShowHideToggle())).called(1);
      await expectLater(showHideFinder, findsOneWidget);
      await expectLater(hideIconFinder, findsNothing);
      await expectLater(showIconFinder, findsOneWidget);
    });
  });
}
