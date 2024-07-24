import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metro_chat/Features/Home/home_screen.dart';
import 'package:metro_chat/Features/Splash/splash_screen.dart';

// Enum for route names

enum AppRoute {
  splash,
  home,
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoute.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Route not found: ${state.uri.path}')),
    ),
  );

  static void go(BuildContext context, AppRoute route,
      {Map<String, String> queryParams = const {}, Object? extra}) {
    context.goNamed(route.name, queryParameters: queryParams, extra: extra);
  }

  static void push(BuildContext context, AppRoute route,
      {Map<String, String> queryParams = const {}, Object? extra}) {
    context.pushNamed(route.name, queryParameters: queryParams, extra: extra);
  }

  static void replace(BuildContext context, AppRoute route,
      {Map<String, String> queryParams = const {}, Object? extra}) {
    context.replaceNamed(route.name,
        queryParameters: queryParams, extra: extra);
  }

  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    context.pop(result);
  }
}
