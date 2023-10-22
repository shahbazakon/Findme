import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

//con
class ThemeConstants {
  static ThemeData getTheme(context) {
    return ThemeData(
      dialogTheme: const DialogTheme(backgroundColor: Colors.white),
      scaffoldBackgroundColor: AppColors.light,
      primaryColor: AppColors.primary,
      fontFamily: AppFonts.montserrat,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColors.light,
        titleTextStyle: SubTitleHelper.h7,
      ),
      colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan),
    );
  }
}

//app Container UI
Decoration appBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: AppColors.lightGrey1,
    border: Border.all(color: AppColors.lightGrey2, width: 2));

//app Padding
EdgeInsetsGeometry primaryPadding = const EdgeInsets.symmetric(horizontal: 15);
