import 'package:flutter/material.dart';

import 'core/constants/theme_contants.dart';
import 'core/utils/utils_methods.dart';
import 'feature/Home/presentation/pages/home_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find me',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeConstants.getTheme(context),
      // home: const SplashScreen(),
      home: const HomeScreen(),
    );
  }
}
