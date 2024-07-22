import 'package:flutter/material.dart';
import 'package:metro_chat/Features/Splash/splash_screen.dart';

import 'Core/Theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}
