import 'package:flutter/material.dart';

import 'Core/Theme/app_theme.dart';
import 'Features/Splash/splash_screen.dart';

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
