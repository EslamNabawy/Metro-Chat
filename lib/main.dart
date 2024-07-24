import 'package:flutter/material.dart';

import 'Core/Routing/app_router.dart';
import 'Core/Theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
