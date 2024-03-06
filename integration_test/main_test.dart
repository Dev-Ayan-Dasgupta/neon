import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:neon_student/main.dart' as app;
import 'package:neon_student/presentation/pages/index.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets(
        'Given a Subscribe button, When the button is tapped on, Then the user is taken to Checkout screen',
        (tester) async {
      app.main();

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      expect(find.byKey(const ValueKey('Subscribe')), findsOneWidget);
      await tester.tap(find.byKey(const ValueKey('Subscribe')));
      await tester.pumpAndSettle();

      expect(find.byType(CheckoutPage), findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
    });

    testWidgets(
        'Given textfields for Email and Password, When correct values are entered, Then user is taken to their DashboardPage',
        (tester) async {
      // Arrange
      app.main();

      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      // Act
      Finder emailTextField = find.byKey(const ValueKey('EmailAddress'));
      Finder passwordTextField = find.byKey(const ValueKey('Password'));
      Finder loginButton = find.byKey(const ValueKey('Login'));
      Finder dashboardPage = find.byType(DashboardPage);

      // Assert
      expect(emailTextField, findsOneWidget);
      expect(passwordTextField, findsOneWidget);
      expect(loginButton, findsOneWidget);

      await tester.enterText(emailTextField, 'ayan@qolarisdata.com');
      await Future.delayed(const Duration(seconds: 2));

      await tester.enterText(passwordTextField, 'Test@123');
      await Future.delayed(const Duration(seconds: 2));

      await tester.tap(loginButton);
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      expect(dashboardPage, findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));
    });
  });
}
