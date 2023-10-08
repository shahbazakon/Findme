import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeData getTheme(context) {
    return ThemeData(
      dialogBackgroundColor: Colors.white,
      dialogTheme: const DialogTheme(backgroundColor: Colors.white),
      primaryColor: Colors.blue,
      primarySwatch: Colors.grey,
      primaryColorDark: Colors.green,
      primaryColorLight: Colors.white,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.cyanAccent,
          elevation: 0.0,
          titleTextStyle: TextStyle(fontSize: 20, color: Color(0xfff11403A)),
          iconTheme: IconThemeData(color: Colors.blue)),
    );
  }
}
