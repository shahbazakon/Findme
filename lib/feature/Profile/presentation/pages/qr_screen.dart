import 'dart:developer';
import 'dart:io';

import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/Profile/presentation/widget/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class QRScreen extends StatefulWidget {
  QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  AppLocalizations? translate;

  void initState() {
    translate = AppLocalizations.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: width,
        child: Stack(
          children: [
            Screenshot(
              controller: screenshotController,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.light),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: "profileQRKey",
                      child: GradientWidget(
                        child: QrImageView(
                          data: '1234567890',
                          version: QrVersions.auto,
                          size: height * .38,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Hero(
                        tag: "profileNameKey",
                        child: Material(
                          color: Colors.transparent,
                          child: Text(
                            translate!.translate("Aliya Hayat"),
                            style: TextHelper.h1
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "profileUsernameKey",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          translate!.translate("@theroselady"),
                          style: SubTitleHelper.h10,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: width,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                decoration: BoxDecoration(
                    color: AppColors.light,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.lightGrey2,
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(1, 0))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      translate!.myQRCode,
                      style: TextHelper.h7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                          translate!.peopleCanScanYourQRCodeToConnectWithYou,
                          style: SubTitleHelper.h11
                              .copyWith(color: AppFontsColors.lightGrey3)),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(
                        AppIcons.upload,
                        scale: 4,
                        color: AppColors.dark,
                      ),
                      title:
                          Text(translate!.shareCode, style: SubTitleHelper.h10),
                      onTap: shareScreenShort,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Image.asset(
                        AppIcons.upload,
                        scale: 4,
                        color: AppColors.dark,
                      ),
                      title: Text(translate!.saveToCameraRoll,
                          style: SubTitleHelper.h10),
                      onTap: saveScreenShort,
                    ),
                    SizedBox(
                      height: height * .05,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Save ScreenShort
  Future<void> saveScreenShort() async {
    screenshotController.capture().then((capturedImage) async {
      String fileName = "FindMe_QR_${dateFormatter5.format(DateTime.now())}";
      final image =
          await ImageGallerySaver.saveImage(capturedImage!, name: fileName);

      showSnackBar(title: translate!.qrDownloadSuccess);
    }).catchError((onError) {
      showSnackBar(title: onError);
    });
  }

  // Share ScreenShort
  Future<void> shareScreenShort() async {
    screenshotController.capture().then((capturedImage) async {
      final tempDir = await getTemporaryDirectory();
      final tempFile =
          File('${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png');
      await tempFile.writeAsBytes(capturedImage!);

      Share.shareXFiles([XFile(tempFile.path)], subject: "FindMe");
    }).catchError((onError) {
      log("qr_scanner.dart",
          name: "shareScreenShort", error: onError.toString());
      showSnackBar(title: onError.toString());
    });
  }
}
