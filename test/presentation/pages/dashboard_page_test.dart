import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neon_student/main.dart';
import 'package:neon_student/presentation/pages/index.dart';

void main() {
  // TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() => GoogleFonts.config.allowRuntimeFetching = false);
  testWidgets('test for blue and red boxes', (tester) async {
    // Arrange
    await tester.pumpWidget(const MainApp());
    await tester.pumpWidget(const MaterialApp(
      home: DashboardPage(),
    ));

    // Act
    Finder blueButtonFinder = find.byKey(const ValueKey('BlueButton'));
    Finder blueBoxFinder = find.byKey(const ValueKey('BlueBox'));
    Finder redButtonFinder = find.byKey(const ValueKey('RedButton'));
    Finder redBoxFinder = find.byKey(const ValueKey('RedBox'));

    // Assert
    expect(blueButtonFinder, findsOneWidget);
    expect(blueBoxFinder, findsNothing);
    expect(redButtonFinder, findsOneWidget);
    expect(redBoxFinder, findsNothing);

    await tester.tap(blueButtonFinder);
    await tester.pumpAndSettle();
    expect(blueBoxFinder, findsOneWidget);

    await tester.runAsync(() async {
      await tester.tap(redButtonFinder);
      await Future.delayed(const Duration(seconds: 3));
      await tester.pumpAndSettle();
    });

    expect(redBoxFinder, findsOneWidget);
  });
}
