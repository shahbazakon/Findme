import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/material.dart';

import '../utils/text_style.dart';

void showSnackBar({required String title, Duration? duration}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.black,
    duration: duration ?? const Duration(seconds: 3),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    behavior: SnackBarBehavior.floating,
    content: Text(
      title,
      style: SubtitleHelper.h10
          .copyWith(color: Colors.white, fontWeight: FontWeight.normal),
    ),
  );
  ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
}
