import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_profile_info_tile.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/attachment_list_tile.com.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/blur_background.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/cilpper_shape.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CorporatePortfolioScreen extends StatefulWidget {
  final String corporateCardID;
  const CorporatePortfolioScreen({super.key, required this.corporateCardID});

  @override
  State<CorporatePortfolioScreen> createState() =>
      _CorporatePortfolioScreenState();
}

class _CorporatePortfolioScreenState extends State<CorporatePortfolioScreen> {
  String videoUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  String profileImage =
      "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      body: Stack(
        children: [
          BlurBackground(
            bgImage: profileImage,
          ),
          SingleChildScrollView(
            physics: const ScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics())),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, color: AppColors.light)),
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            translate!.translate("Aliya Hayat"),
                            style: TextHelper.h2
                                .copyWith(color: AppFontsColors.light),
                          ),
                          Text(
                            translate!.translate("@theroselady"),
                            style: SubTitleHelper.h9
                                .copyWith(color: AppFontsColors.light),
                          ),
                          Container(
                            width: width * .85,
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              translate!.lorem,
                              textAlign: TextAlign.center,
                              style: SubTitleHelper.h12
                                  .copyWith(color: AppFontsColors.light),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox.shrink()
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                profileBanner(),
                Container(
                  margin: const EdgeInsets.all(15),
                  decoration: appBoxDecoration,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sectionTitle(
                          title:
                              "${translate!.corporate} ${translate!.details}"),
                      CustomProfileInfoTile(
                        leadingImage: AppIcons.beg,
                        title: translate!.lorem,
                      ),
                      CustomProfileInfoTile(
                        leadingImage: AppIcons.beg,
                        title: "Aliyahayat97@email.com",
                      ),
                      CustomProfileInfoTile(
                        leadingImage: AppIcons.portfolio,
                        title: "02-01-1997",
                      ),
                      CustomProfileInfoTile(
                        leadingImage: AppIcons.creditCard,
                        title: '''
${translate!.street}: ${translate!.translate("Deerah Dist.")},
${translate!.city}: ${translate!.translate("Riyadh Deerah Dist.")}
${translate!.street}: ${translate!.translate("Riyadh")}
${translate!.phoneNumber}: ${translate!.translate("00966 1 4132260")}
${translate!.countryCallingCode}: ${translate!.translate("+966")}
${translate!.country}: ${translate!.translate("Saudi Arabia")}
                        ''',
                      ),
                      CustomProfileInfoTile(
                        leadingImage: AppIcons.promoCode,
                        title: translate!.female,
                      ),
                      CustomProfileInfoTile(
                        leadingImage: AppIcons.promoCode,
                        title: translate!.translate("+678-9876543456"),
                      ),
                      sectionTitle(title: translate!.socialProfile),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            socialAccountsButton(
                                iconImage: AppIcons.facebook,
                                onTap: () {
                                  showSnackBar(
                                      title: translate!.linkFacebookAccount);
                                }),
                            socialAccountsButton(
                                iconImage: AppIcons.instagram,
                                onTap: () {
                                  showSnackBar(
                                      title: translate!.linkInstagramAccount);
                                }),
                            socialAccountsButton(
                                iconImage: AppIcons.twitter,
                                onTap: () {
                                  showSnackBar(
                                      title: translate!.linkTwitterAccount);
                                }),
                            socialAccountsButton(
                                iconImage: AppIcons.snapchat,
                                onTap: () {
                                  showSnackBar(
                                      title: translate!.linkSnapchatAccount);
                                }),
                          ],
                        ),
                      ),
                      sectionTitle(title: translate!.video),
                      SizedBox(
                        width: width,
                        height: height * .2,
                        child: Row(
                          children: [
                            Expanded(
                              child: Hero(
                                tag: "AttachedVideo",
                                child: CustomVideoContainer(
                                  thumbnail:
                                      "https://mainstreammarketing.ca/wp-content/uploads/2021/08/Post-4-Image-scaled.jpeg",
                                  videoUrl: videoUrl,
                                ),
                              ),
                            ),
                            Expanded(
                              child: CustomVideoContainer(
                                thumbnail:
                                    "https://mainstreammarketing.ca/wp-content/uploads/2021/08/Post-4-Image-scaled.jpeg",
                                videoUrl: videoUrl,
                              ),
                            )
                          ],
                        ),
                      ),
                      sectionTitle(title: translate!.attachments),
                      ListView.builder(
                        physics: const ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return AttachmentListTile(
                            title: translate!.resume,
                            onDownloadClick: () {
                              //TODO: Add Download Functionality
                              showSnackBar(title: translate!.download);
                            },
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Profile banner
  Widget profileBanner() {
    AppLocalizations? translate = AppLocalizations.of(context);
    return SizedBox(
      height: height * .38,
      child: Stack(
        children: [
          Positioned(
            left: width * .3,
            top: 0,
            child: ClipperShape(
              size: width * .37,
              child: Image.network(
                profileImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: width * .15,
            top: height * .129,
            child: ClipperShape(
              size: width * .3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(translate!.translate("1450"),
                      style: TextHelper.h5
                          .copyWith(color: AppFontsColors.primary)),
                  Text(translate!.followers,
                      style: TextHelper.h10
                          .copyWith(color: AppFontsColors.lightGrey3)),
                ],
              ),
            ),
          ),
          Positioned(
            left: width * .51,
            top: height * .143,
            child: ClipperShape(
              size: width * .26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(translate!.translate("28k"),
                      style: TextHelper.h6
                          .copyWith(color: AppFontsColors.primary)),
                  Text(translate!.views,
                      style: TextHelper.h10
                          .copyWith(color: AppFontsColors.lightGrey3)),
                ],
              ),
            ),
          ),
          Positioned(
            left: width * .37,
            top: height * .22,
            child: ClipperShape(
              size: width * .22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(translate!.translate("720"),
                      style: TextHelper.h7
                          .copyWith(color: AppFontsColors.primary)),
                  Text(translate!.following,
                      style: TextHelper.h12
                          .copyWith(color: AppFontsColors.lightGrey3)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Section Title
  Padding sectionTitle({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Text(
        title,
        style: TextHelper.h7,
        textAlign: TextAlign.start,
      ),
    );
  }

  // Social Account Button
  Padding socialAccountsButton(
      {required String iconImage, required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          iconImage,
          width: 40,
        ),
      ),
    );
  }
}
