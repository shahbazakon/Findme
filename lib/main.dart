import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/auth_featrues/onBoarding/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

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
      home: const SplashScreen(),
    );
  }
}
