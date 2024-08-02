import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metro_chat/Features/Auth/sign_in_screen.dart';
import 'package:metro_chat/Features/Auth/sign_up_screen.dart';
import 'package:metro_chat/Features/Home/home_screen.dart';
import 'package:metro_chat/Features/Splash/splash_screen.dart';

// Enum for route names
enum AppRoute {
  splash,
  home,
  signup,
  signin,
}

extension AppRouteExtension on AppRoute {
  String get name {
    switch (this) {
      case AppRoute.splash:
        return 'splash';
      case AppRoute.home:
        return 'home';
      case AppRoute.signup:
        return 'signup';
      case AppRoute.signin:
        return 'signin';
      default:
        return '';
    }
  }
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.splash.name,
        pageBuilder: (context, state) => _buildPage(
          state,
          const SplashScreen(),
          _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        pageBuilder: (context, state) => _buildPage(
          state,
          const HomeScreen(),
          _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/signup',
        name: AppRoute.signup.name,
        pageBuilder: (context, state) => _buildPage(
          state,
          const SignupScreen(),
          _fadeTransition,
        ),
      ),
      GoRoute(
        path: '/signin',
        name: AppRoute.signin.name,
        pageBuilder: (context, state) => _buildPage(
          state,
          const SignInScreen(),
          _fadeTransition,
        ),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route not found: ${state.uri.path}')),
    ),
  );

  static final List<AppRoute> _routeStack = [];

  static const int _stackLimit = 5; // Set your stack limit here

  static void _ensureStackLimit() {
    while (_routeStack.length > _stackLimit) {
      _routeStack.removeAt(0); // Remove the oldest route
    }
  }

  static void go(BuildContext context, AppRoute route,
      {Map<String, String> queryParams = const {}, Object? extra}) {
    _routeStack.add(route);
    _ensureStackLimit();
    final routeName = route.name;
    if (routeName.isEmpty) {
      throw Exception("Route name cannot be empty");
    }
    context.goNamed(routeName, queryParameters: queryParams, extra: extra);
  }

  static void push(BuildContext context, AppRoute route,
      {Map<String, String> queryParams = const {}, Object? extra}) {
    _routeStack.add(route);
    _ensureStackLimit();
    final routeName = route.name;
    if (routeName.isEmpty) {
      throw Exception("Route name cannot be empty");
    }
    context.pushNamed(routeName, queryParameters: queryParams, extra: extra);
  }

  static void replace(BuildContext context, AppRoute route,
      {Map<String, String> queryParams = const {}, Object? extra}) {
    if (_routeStack.isNotEmpty) {
      _routeStack.removeLast(); // Replace the last route
    }
    _routeStack.add(route);
    _ensureStackLimit();
    final routeName = route.name;
    if (routeName.isEmpty) {
      throw Exception("Route name cannot be empty");
    }
    context.replaceNamed(routeName, queryParameters: queryParams, extra: extra);
  }

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (_routeStack.isNotEmpty) {
      _routeStack.removeLast();
    }
    context.pop(result);
  }

  static CustomTransitionPage _buildPage(
      GoRouterState state,
      Widget child,
      Widget Function(
              BuildContext, Animation<double>, Animation<double>, Widget)
          transitionsBuilder) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: transitionsBuilder,
    );
  }

  static Widget _fadeTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
        reverseCurve: Curves.easeInOut,
      ),
      child: child,
    );
  }
}
