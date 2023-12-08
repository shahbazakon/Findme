// ignore_for_file: deprecated_member_use

import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/dialogBox/portolio_list_pop.dart';
import 'package:find_me/feature/Profile/presentation/pages/qr_screen.dart';
import 'package:find_me/feature/Profile/presentation/widget/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    String profileImage =
        "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg";
    return Scaffold(
      body: Stack(
        children: [
          ShadowOverlay(
            shadowWidth: width,
            shadowHeight: height * .3,
            child: Hero(
              tag: "BackgroundImageTag",
              child: Image.network(profileImage,
                  width: width,
                  height: contentHeight + height * .02,
                  fit: BoxFit.cover, errorBuilder: (BuildContext context,
                      Object error, StackTrace? stackTrace) {
                // Display a placeholder image when the network image fails to load
                return Image.asset(
                  AppIcons.placeholderImage,
                  width: width,
                  height: height,
                  fit: BoxFit.cover,
                );
              }),
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
                              fadeNavigator(screenName: QRScreen());
                            },
                            child: Hero(
                              tag: "profileQRKey",
                              child: GradientWidget(
                                child: QrImageView(
                                  data: '1234567890',
                                  version: QrVersions.auto,
                                  size: 80.0,
                                ),
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
                                  translate!.translate("Aliya Hayat"),
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
                                  translate!.translate("@theroselady"),
                                  style: SubTitleHelper.h10,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: height * .02),
                    Text(
                      translate!.lorem,
                      textAlign: TextAlign.center,
                      style: SubTitleHelper.h12,
                    ),
                    SizedBox(height: height * .02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        followCountTile(
                            title: "1321", subtitle: translate!.followers),
                        Container(
                          width: 1,
                          height: 40,
                          color: AppColors.dark,
                        ),
                        followCountTile(
                            title: "2105", subtitle: translate!.following),
                      ],
                    ),
                    SizedBox(height: height * .01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppButton(
                          label: translate!.follow,
                          buttonWidth: width * .4,
                          onPressed: () {},
                        ),
                        AppButton(
                            label: translate!.portfolio,
                            buttonWidth: width * .4,
                            onPressed: () {
                              portfolioListPop(
                                bgImage: profileImage,
                                isTransparent: true,
                                isReplacementRoute: false,
                                showCloseButton: true,
                              );
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
