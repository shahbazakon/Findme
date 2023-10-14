import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeData getTheme(context) {
    return ThemeData(
      dialogTheme: const DialogTheme(backgroundColor: Colors.white),
      scaffoldBackgroundColor: AppColors.light,
      primaryColor: AppColors.primary,
      fontFamily: AppFonts.montserrat,
      appBarTheme: AppBarTheme(
          centerTitle: true, elevation: 0.0, backgroundColor: AppColors.light),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan),
    );
  }
}
