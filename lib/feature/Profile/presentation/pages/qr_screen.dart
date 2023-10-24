import 'package:find_me/core/utils/app_assets.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/feature/Profile/presentation/widget/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/utils/utils_methods.dart';

class QRScreen extends StatelessWidget {
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                        "Aliya Hayat",
                        style:
                            TextHelper.h1.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: "profileUsernameKey",
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      "@theroselady",
                      style: SubTitleHelper.h10,
                    ),
                  ),
                )
              ],
            ),
            Container(
              width: width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
                    "My QR Code",
                    style: TextHelper.h7,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                        "People can scan your QR Code to connect with you !",
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
                    title: Text("Share Code", style: SubTitleHelper.h10),
                    onTap: () {
                      //TODO: add Download QR Functionality
                    },
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.asset(
                      AppIcons.upload,
                      scale: 4,
                      color: AppColors.dark,
                    ),
                    title:
                        Text("Save to Camera Roll", style: SubTitleHelper.h10),
                    onTap: () {
                      //TODO: add Download QR Functionality
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
