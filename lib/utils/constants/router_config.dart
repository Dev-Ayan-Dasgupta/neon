import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neon_student/presentation/pages/index.dart';
import 'package:neon_student/utils/constants/index.dart';

class GoRouteInformation {
  static final GoRouter router = GoRouter(
    observers: [MyGoRouterObserver()],
    initialLocation: Routes.login,
    routes: [
      GoRoute(
        path: Routes.login,
        name: Routes.login,
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            path: Routes.checkout,
            name: Routes.checkout,
            builder: (context, state) => const CheckoutPage(),
          ),
        ],
      ),
      GoRoute(
        path: "/${Routes.dashboard}",
        name: Routes.dashboard,
        builder: (context, state) => const DashboardPage(),
      ),
    ],
  );
}

class MyGoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // log('MyTest didPush: $route');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // log('MyTest didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    // log('MyTest didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    // log('MyTest didReplace: $newRoute');
  }
}
