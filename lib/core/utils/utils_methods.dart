import 'package:flutter/material.dart';

//navigatorKey used to get page state and context dynamic
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// dynamic size
Size size = MediaQuery.of(navigatorKey.currentContext!).size;
double height = size.height;
double width = size.width;

//app Padding

EdgeInsetsGeometry primaryPadding = const EdgeInsets.symmetric(horizontal: 15);
