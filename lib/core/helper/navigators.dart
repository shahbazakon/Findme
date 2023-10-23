import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BouncingNavigation extends PageRouteBuilder {
  final Widget widget;

  BouncingNavigation({required this.widget})
      : super(
            transitionDuration: const Duration(milliseconds: 270),
            transitionsBuilder: (BuildContext con, Animation<double> animation,
                Animation<double> secAnimation, Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInOutBack);
              return ScaleTransition(
                scale: animation,
                alignment: Alignment.topCenter,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secanimation) {
              return widget;
            });
}

class SlideNavigation extends PageRouteBuilder {
  final Widget widget;

  SlideNavigation({required this.widget})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext con, Animation<double> animation,
                Animation<double> secAnimation, Widget child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              return SlideTransition(
                transformHitTests: true,
                position:
                    Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                        .animate(animation),
                textDirection: TextDirection.ltr,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secanimation) {
              return widget;
            });
}

class DownSlideNavigation extends PageRouteBuilder {
  final Widget widget;

  DownSlideNavigation({required this.widget})
      : super(
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext con, Animation<double> animation,
                Animation<double> secAnimation, Widget child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              return SlideTransition(
                transformHitTests: true,
                position:
                    Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero)
                        .chain(CurveTween(curve: Curves.ease))
                        .animate(animation),
                textDirection: TextDirection.ltr,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secanimation) {
              return widget;
            });
}

class FadeNavigation extends PageRouteBuilder {
  final Widget widget;

  FadeNavigation({required this.widget})
      : super(
            transitionDuration: const Duration(milliseconds: 650),
            transitionsBuilder: (BuildContext con, Animation<double> animation,
                Animation<double> secAnimation, Widget child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut);
              return FadeTransition(
                opacity: animation,
                alwaysIncludeSemantics: true,
                child: child,
              );
            },
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secanimation) {
              return widget;
            });
}

enum NavigatorType { PUSH, PUSHREPLACE, PUSHREMOVEUNTIL }

cupertinoNavigator(
    {required Widget screenName,
    NavigatorType? type,
    Function(dynamic)? then}) {
  switch (type) {
    case NavigatorType.PUSH:
      Navigator.push(navigatorKey.currentContext!,
          CupertinoPageRoute(builder: (context) => screenName)).then((value) {
        if (then != null) {
          then(value);
        }
      });
      return;
    case NavigatorType.PUSHREPLACE:
      Navigator.pushReplacement(navigatorKey.currentContext!,
          CupertinoPageRoute(builder: (context) => screenName));
      return;
    case NavigatorType.PUSHREMOVEUNTIL:
      Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          CupertinoPageRoute(builder: (context) => screenName),
          (Route<dynamic> route) => false);
      return;
    default:
      Navigator.push(navigatorKey.currentContext!,
          CupertinoPageRoute(builder: (context) => screenName)).then((value) {
        if (then != null) {
          then(value);
        }
      });
  }
}

downSlideNavigator({required Widget screenName, NavigatorType? type}) {
  switch (type) {
    case NavigatorType.PUSH:
      Navigator.push(navigatorKey.currentContext!,
          DownSlideNavigation(widget: screenName));
      return;
    case NavigatorType.PUSHREPLACE:
      Navigator.pushReplacement(navigatorKey.currentContext!,
          DownSlideNavigation(widget: screenName));
      return;
    case NavigatorType.PUSHREMOVEUNTIL:
      Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          DownSlideNavigation(widget: screenName),
          (Route<dynamic> route) => false);
      return;
    default:
      Navigator.push(navigatorKey.currentContext!,
          DownSlideNavigation(widget: screenName));
      return;
  }
}

fadeNavigator(
    {required Widget screenName,
    NavigatorType? type,
    Function(dynamic)? then}) {
  switch (type) {
    case NavigatorType.PUSH:
      Navigator.push(
              navigatorKey.currentContext!, FadeNavigation(widget: screenName))
          .then((value) {
        if (then != null) {
          then(value);
        }
      });
      return;
    case NavigatorType.PUSHREPLACE:
      Navigator.pushReplacement(
          navigatorKey.currentContext!, FadeNavigation(widget: screenName));
      return;
    case NavigatorType.PUSHREMOVEUNTIL:
      Navigator.pushAndRemoveUntil(navigatorKey.currentContext!,
          FadeNavigation(widget: screenName), (Route<dynamic> route) => false);
      return;
    default:
      Navigator.push(
              navigatorKey.currentContext!, FadeNavigation(widget: screenName))
          .then((value) {
        if (then != null) {
          then(value);
        }
      });
      return;
  }
}

materialNavigator({required Widget screenName, NavigatorType? type}) {
  switch (type) {
    case NavigatorType.PUSH:
      Navigator.push(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => screenName));
      return;
    case NavigatorType.PUSHREPLACE:
      Navigator.pushReplacement(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => screenName));
      return;
    case NavigatorType.PUSHREMOVEUNTIL:
      Navigator.pushAndRemoveUntil(
          navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => screenName),
          (Route<dynamic> route) => false);
      return;
    default:
      Navigator.push(navigatorKey.currentContext!,
          MaterialPageRoute(builder: (context) => screenName));
      return;
  }
}
