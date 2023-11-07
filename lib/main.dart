import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/auth_featrues/onBoarding/presentation/pages/splash_screen.dart';
import 'package:find_me/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
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
      supportedLocales: L10n.supportedLanguages,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      theme: ThemeConstants.getTheme(context),
      home: const SplashScreen(),

      // Constants.Prefs
    );
  }
}
