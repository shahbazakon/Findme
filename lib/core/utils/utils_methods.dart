import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

///--------------------- Value Initialization
///-----------------------------------------------------------------------------
//navigatorKey used to get page state and context dynamic
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// dynamic size
Size size = MediaQuery.of(navigatorKey.currentContext!).size;
double height = size.height;
double width = size.width;

//
GetIt locator = GetIt.instance;

// SharedPreferences
SharedPreferences? sharedPreferences;

// Base URL
String userDetailsBaseURL = "https://fyndme.net/detail";

///-------------------- Method Initialization
///-----------------------------------------------------------------------------

// Dialog Box used to select item form Dialog Box List
Future<String?> openSelectionDialog(
    {required List<String> data, String? title}) async {
  return showDialog<String>(
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: appDialogBoxBorder,
        title: Text(
          title ?? 'Select',
          style: TextHelper.h8,
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: data.length,
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
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

// get Permission based on device and sdk
Future<bool> getPermission() async {
  late final Map<Permission, PermissionStatus> statuses;
  var allAccepted = true;

  if (Platform.isAndroid) {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      statuses = await [Permission.storage].request();
    } else {
      statuses = await [Permission.photos].request();
    }
  } else {
    statuses = await [Permission.storage].request();
  }

  statuses.forEach((permission, status) {
    if (status != PermissionStatus.granted) {
      allAccepted = false;
    }
  });
  return allAccepted;
}

// Pick Image File Manager
Future<FilePickerResult?> pickFileFromFileManager({FileType? type}) async {
  // Request necessary permissions for accessing storage
  bool hasPermission = await getPermission();
  try {
    if (hasPermission) {
      if (type != null) {
        return await FilePicker.platform.pickFiles(
          type: type,
        );
      } else {
        return await FilePicker.platform.pickFiles();
      }
    } else {
      showSnackBar(title: "Permission denied to access storage.");
      // Handle permission denied
      await [
        Permission.photos,
        Permission.storage,
      ].request();
    }
  } catch (error) {
    log("Error:", error: "$error");
    showSnackBar(title: "$error");
  }
}

// date Picker
Future<DateTime?> appDatePicker(
    {DateTime? firstDate,
    DateTime? lastDate,
    DateTime? initialDate,
    String? helpText}) async {
  final DateTime? pickedDate = await showDatePicker(
      context: navigatorKey.currentContext!,
      helpText: helpText,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1950),
      lastDate: lastDate ?? DateTime.now());
  if (pickedDate != null) {
    return pickedDate;
  }
}
