import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

Future openFile({String? fileName, required String url}) async {
  final downloadedFile =
      await downloadFile(url: url, fileName: fileName, openOnly: true);
  if (downloadedFile == null) return;
  OpenFile.open(downloadedFile.path);
}

Future<File?> downloadFile(
    {required String url, String? fileName, bool openOnly = false}) async {
  AppLocalizations? translate =
      AppLocalizations.of(navigatorKey.currentContext!);
  Directory? localDirectory =
      openOnly ? await getDownloadsDirectory() : await getDownloadPath();
  final file =
      File("${localDirectory?.path}/${fileName ?? url.split("/").last}");

  log(file.path);
  try {
    final response = await Dio().get(url,
        options:
            Options(responseType: ResponseType.bytes, followRedirects: false));
    final ref = file.openSync(mode: FileMode.write);
    if (response.statusCode == 200) {
      if (!openOnly) {
        showSnackBar(
            title:
                "${file.path}\n${translate!.download} ${translate!.successful}");
      }
      log(file.path, name: "Download File Path");
      ref.writeFromSync(response.data);
      await ref.close();
      return file;
    } else {
      showSnackBar(title: translate!.oopsSomethingWentWrong);
    }
  } catch (error) {
    showSnackBar(title: "Error: $error");
    return null;
  }
}

Future<Directory?> getDownloadPath() async {
  Directory? directory;
  try {
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = Directory('/storage/emulated/0/Download');
      // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
      // ignore: avoid_slow_async_io
      if (!await directory.exists()) {
        directory = await getExternalStorageDirectory();
      }
    }
  } catch (err, stack) {
    showSnackBar(title: "Cannot get download folder path");
  }
  return directory;
}
