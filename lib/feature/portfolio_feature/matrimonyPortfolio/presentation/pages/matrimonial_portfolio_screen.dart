import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_profile_info_tile.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/feature/portfolio_feature/presonalPortfolio/presentation/widget/attachment_list_tile.com.dart';
import 'package:find_me/feature/portfolio_feature/presonalPortfolio/presentation/widget/blur_background.dart';
import 'package:find_me/feature/portfolio_feature/presonalPortfolio/presentation/widget/cilpper_shape.dart';
import 'package:find_me/feature/portfolio_feature/presonalPortfolio/presentation/widget/video_container.dart';
import 'package:flutter/material.dart';

class MatrimonialPortfolioScreen extends StatefulWidget {
  const MatrimonialPortfolioScreen({super.key});

  @override
  State<MatrimonialPortfolioScreen> createState() =>
      _MatrimonialPortfolioScreenState();
}

class _MatrimonialPortfolioScreenState
    extends State<MatrimonialPortfolioScreen> {
  String videoUrl =
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";
  String profileImage =
      "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg";

  @override
  Widget build(BuildContext context) {
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
                            "Aliya Hayat",
                            style: TextHelper.h2
                                .copyWith(color: AppFontsColors.light),
                          ),
                          Text(
                            "@theroselady",
                            style: SubTitleHelper.h9
                                .copyWith(color: AppFontsColors.light),
                          ),
                          Container(
                            width: width * .85,
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
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
                      sectionTitle(title: "Matrimonial Details"),
                      CustomProfileInfoTile(
                        leadingImage: AppIcons.beg,
                        title:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.',
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
Street: Deerah Dist.,
City: Riyadh Deerah Dist.
State: Riyadh
Phone number: 00966 1 4132260
Country calling code: +966
Country: Saudi Arabia
                        ''',
                      ),
                      CustomProfileInfoTile(
                        leadingImage: AppIcons.promoCode,
                        title: "Female",
                      ),
                      CustomProfileInfoTile(
                        leadingImage: AppIcons.promoCode,
                        title: "+678-9876543456",
                      ),
                      sectionTitle(title: "Social Profile"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            socialAccountsButton(
                                iconImage: AppIcons.facebook,
                                onTap: () {
                                  showSnackBar(title: "Link facebook Account");
                                }),
                            socialAccountsButton(
                                iconImage: AppIcons.instagram,
                                onTap: () {
                                  showSnackBar(title: "Link instagram Account");
                                }),
                            socialAccountsButton(
                                iconImage: AppIcons.twitter,
                                onTap: () {
                                  showSnackBar(title: "Link twitter Account");
                                }),
                            socialAccountsButton(
                                iconImage: AppIcons.snapchat,
                                onTap: () {
                                  showSnackBar(title: "Link snapchat Account");
                                }),
                          ],
                        ),
                      ),
                      sectionTitle(title: "Video"),
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
                      sectionTitle(title: "Attachments"),
                      ListView.builder(
                        physics: const ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return AttachmentListTile(
                            title: "Resume",
                            onDownloadClick: () {
                              //TODO: Add Download Functionality
                              showSnackBar(title: "Download");
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
                  Text("1450",
                      style: TextHelper.h5
                          .copyWith(color: AppFontsColors.primary)),
                  Text("Followers",
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
                  Text("28k",
                      style: TextHelper.h6
                          .copyWith(color: AppFontsColors.primary)),
                  Text("Views",
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
                  Text("720",
                      style: TextHelper.h7
                          .copyWith(color: AppFontsColors.primary)),
                  Text("Following",
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
