import 'dart:developer';

import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/auth_featrues/onBoarding/presentation/pages/splash_screen.dart';
import 'package:find_me/l10n/l10n.dart';
import 'package:find_me/service_registation/register_blocs.dart';
import 'package:find_me/service_registation/register_main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/constants/local_storege_key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  RegisterBlocs();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale selectedLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(selectedLocale);
  }
}

class _MyAppState extends State<MyApp> {
  ValueNotifier<Locale> locale = ValueNotifier<Locale>(Locale(
      sharedPreferences!.getString(LocaleStorageKey.appLanguage) ?? 'en'));

  setLocale(Locale lacale) {
    locale.value = lacale;
    locale.notifyListeners();
    log("_locale: ${locale.value}");
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: ValueListenableBuilder<Locale>(
        valueListenable: locale,
        builder: (BuildContext context, localValue, Widget? child) {
          return MaterialApp(
            title: 'Find me',
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            locale: localValue,
            supportedLocales: L10n.supportedLanguages,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            theme: ThemeConstants.getTheme(context),
            home: const SplashScreen(),

            // Constants.Prefs
          );
        },
      ),
    );
  }
}
