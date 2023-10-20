import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

//navigatorKey used to get page state and context dynamic
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// dynamic size
Size size = MediaQuery.of(navigatorKey.currentContext!).size;
double height = size.height;
double width = size.width;

//
GetIt locator = GetIt.instance;

// Dialog Box used to select item form Dialog Box List
Future<String?> openSelectionDialog(
    {required List<String> data, String? title}) async {
  return showDialog<String>(
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          title ?? 'Select',
          style: TextHelper.h8,
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index]),
                onTap: () {
                  Navigator.of(context).pop(data[index]);
                },
              );
            },
          ),
        ),
      );
    },
  );
}
