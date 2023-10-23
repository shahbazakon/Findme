// ignore_for_file: deprecated_member_use

import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/feature/Profile/presentation/pages/protfolio_list_screen.dart';
import 'package:find_me/feature/Profile/presentation/pages/qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shadow_overlay/shadow_overlay.dart';

import '../../../../core/utils/utils_methods.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double contentHeight = height * .58;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ShadowOverlay(
            shadowWidth: width,
            shadowHeight: height * .3,
            child: Hero(
              tag: "BackgroundImageTag",
              child: Image.network(
                "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                width: width,
                height: contentHeight + height * .02,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: height,
              padding: primaryPadding,
              child: SizedBox(
                width: width,
                child: Column(
                  children: [
                    SizedBox(
                      height: contentHeight,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            onTap: () {
                              // cupertinoNavigator(screenName: const);
                              fadeNavigator(screenName: const QRScreen());
                            },
                            child: Hero(
                              tag: "profileQRKey",
                              child: QrImageView(
                                foregroundColor: Colors.purple.shade700,
                                data: '1234567890',
                                version: QrVersions.auto,
                                size: 80.0,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: "profileNameKey",
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  "Aliya Hayat",
                                  style: TextHelper.h1
                                      .copyWith(fontWeight: FontWeight.w500),
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
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                      textAlign: TextAlign.center,
                      style: SubTitleHelper.h12,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        followCountTile(title: "1321", subtitle: "Followers"),
                        Container(
                          width: 1,
                          height: 40,
                          color: AppColors.dark,
                        ),
                        followCountTile(title: "2105", subtitle: "Following"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(
                          label: "Follow",
                          buttonWidth: width * .4,
                          onPressed: () {},
                        ),
                        AppButton(
                            label: "Portfolio",
                            buttonWidth: width * .4,
                            onPressed: () {
                              cupertinoNavigator(
                                  screenName: const PortfolioListScreen(
                                bgImage:
                                    "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                              ));
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Column followCountTile({
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: SubTitleHelper.h8,
        ),
        Text(
          subtitle,
          style: SubTitleHelper.h12.copyWith(color: AppFontsColors.lightGrey4),
        ),
      ],
    );
  }
}
