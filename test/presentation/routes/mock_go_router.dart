import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:neon_student/utils/constants/index.dart';

// class MockGoRouter extends Mock implements GoRouter {}

class MockGoRouterObserver extends Mock implements MyGoRouterObserver {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}
