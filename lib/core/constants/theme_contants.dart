import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeData getTheme(context) {
    return ThemeData(
      dialogTheme: const DialogTheme(backgroundColor: Colors.white),
      primaryColor: AppColors.primary,
      primarySwatch: Colors.cyan,
      fontFamily: AppFonts.montserrat,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0.0,
          titleTextStyle: TextStyle(fontSize: 20, color: Color(0xfff11403A)),
          iconTheme: IconThemeData(color: Colors.blue)),
    );
  }
}
