import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_profile_info_tile.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/data/models/personal_details_model.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/cubit/personal_portfolio_cubit.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/cilpper_shape.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widget/attachment_list_tile.com.dart';
import '../widget/blur_background.dart';

class PersonalPortfolioScreen extends StatefulWidget {
  final String personalCardID;
  const PersonalPortfolioScreen({super.key, required this.personalCardID});

  @override
  State<PersonalPortfolioScreen> createState() =>
      _PersonalPortfolioScreenState();
}

class _PersonalPortfolioScreenState extends State<PersonalPortfolioScreen> {
  PersonalResult? data;
  @override
  void initState() {
    apiCall();
    super.initState();
  }

  // fetch Academic Portfolio Data
  void apiCall() {
    context
        .read<PersonalPortfolioCubit>()
        .fetchPersonalPortfolioDetails(cardID: widget.personalCardID);
  }

  String getSocialMediaURL({required String name}) {
    for (var element in data?.social ?? []) {
      if (name.toLowerCase() == element.title.toString()) {
        return element.label;
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<PersonalPortfolioCubit, PersonalPortfolioState>(
        listener: (context, state) {
          if (state is PersonalPortfolioError) {
            showSnackBar(title: state.errorMsg);
          }
        },
        builder: (context, state) {
          if (state is PersonalPortfolioLoading) {
            return const Loading(isSmall: false);
          } else if (state is PersonalPortfolioLoaded) {
            data = state.personalDetailsModel.result;
            String? profilePicture = data?.picture?.first.url;
            return Stack(
              children: [
                BlurBackground(
                  bgImage: profilePicture,
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
                                icon: Icon(Icons.arrow_back,
                                    color: AppColors.light)),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: width * .8,
                                  child: Text(
                                    translate!.translate(
                                        "${data?.suffix ?? ""} ${data?.firstName ?? ""} ${data?.middleName ?? ""} ${data?.lastName ?? ""}" ??
                                            ""),
                                    overflow: TextOverflow.visible,
                                    style: TextHelper.h5
                                        .copyWith(color: AppFontsColors.light),
                                  ),
                                ),
                                Text(
                                  translate!.translate(
                                      "@theroselady"), //TODO: add username
                                  style: SubTitleHelper.h9
                                      .copyWith(color: AppFontsColors.light),
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
                      profileBanner(
                          profileImage: profilePicture,
                          followerCount:
                              "0", //TODO: add Follower Following and views
                          followingCount: "0",
                          viewCount: "0"),
                      Container(
                        margin: const EdgeInsets.all(15),
                        decoration: appBoxDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            sectionTitle(title: translate!.personalDetails),
                            CustomProfileInfoTile(
                              leadingImage: AppIcons.beg,
                              title: data?.tagLine ?? "",
                            ),
                            CustomProfileInfoTile(
                              leadingImage: AppIcons.beg,
                              title: "${data?.primaryEmail}",
                            ),
                            Visibility(
                              visible: data?.dob != null,
                              child: CustomProfileInfoTile(
                                leadingImage: AppIcons.portfolio,
                                title: dateFormatter2.format(
                                    DateTime.parse(data!.dob.toString())),
                              ),
                            ),
                            CustomProfileInfoTile(
                              leadingImage: AppIcons.creditCard,
                              title: '''
${translate!.street}: ${translate!.translate("${data?.primaryAddress}")},
${translate!.city}: ${translate!.translate("${data?.city}")}
zipCode: ${translate!.translate("${data?.zipCode}")} //TODO: make Zip Code dynamic 
${translate!.country}: ${translate!.translate("${data?.country}")}
${translate!.countryCallingCode}: ${translate!.translate("${data?.mobile?.first.phoneCode}")}
${translate!.phoneNumber}: ${translate!.translate("${data?.mobile?.first.number}")}
                        ''',
                            ),
                            CustomProfileInfoTile(
                              leadingImage: AppIcons.promoCode,
                              title: translate!.female,
                            ),
                            CustomProfileInfoTile(
                              leadingImage: AppIcons.promoCode,
                              title:
                                  "${extractPhoneCode(completeValue: data?.mobile?.first.phoneCode ?? "")} ${data?.mobile?.first.number}",
                            ),
                            sectionTitle(title: translate!.socialProfile),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              // child: Row(
                              //   children: [
                              //     socialAccountsButton(
                              //         iconImage: AppIcons.facebook,
                              //         onTap: () {
                              //           launchURL(
                              //               url: getSocialMediaURL(
                              //                   name: "facebook"));
                              //         }),
                              //     socialAccountsButton(
                              //         iconImage: AppIcons.instagram,
                              //         onTap: () {
                              //           showSnackBar(
                              //               title: translate!
                              //                   .linkInstagramAccount);
                              //         }),
                              //     socialAccountsButton(
                              //         iconImage: AppIcons.twitter,
                              //         onTap: () {
                              //           showSnackBar(
                              //               title:
                              //                   translate!.linkTwitterAccount);
                              //         }),
                              //     socialAccountsButton(
                              //         iconImage: AppIcons.snapchat,
                              //         onTap: () {
                              //           showSnackBar(
                              //               title:
                              //                   translate!.linkSnapchatAccount);
                              //         }),
                              //   ],
                              // ),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: data?.social?.length ?? 0,
                                itemBuilder: (context, index) {
                                  return socialAccountsButton(
                                      iconImage:
                                          "assets/icons/${data?.social?[index].title?.toLowerCase()}.png",
                                      onTap: () {
                                        launchURL(
                                            url: getSocialMediaURL(
                                                name:
                                                    "${data?.social?[index].title}"));
                                      });
                                },
                              ),
                            ),
                            sectionTitle(title: "Video"),
                            GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              childAspectRatio: 15 / 11,
                              shrinkWrap: true,
                              children: List.generate(
                                  data?.videoLink?.length ?? 0, (index) {
                                return Hero(
                                  tag: "AttachedVideo",
                                  child: CustomVideoContainer(
                                    videoUrl: "${data?.videoLink![index].link}",
                                  ),
                                );
                              }),
                            ),
                            Visibility(
                                visible: data?.achievements?.length != 0,
                                child: sectionTitle(
                                    title: translate!.attachments)),
                            ListView.builder(
                              physics: const ScrollPhysics(
                                  parent: NeverScrollableScrollPhysics()),
                              shrinkWrap: true,
                              itemCount: /* data.achievements?.length ?? 0*/ 2,
                              itemBuilder: (context, index) {
                                return AttachmentListTile(
                                  title: translate!.resume,
                                  onDownloadClick: () {
                                    //TODO: Add Download Functionality
                                    // showSnackBar(title: translate!.download);
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
            );
          } else {
            return const Center(
              child: Text("OOps, Something went wrong"),
              //TODO: make String Code dynamic
            );
          }
        },
      ),
    );
  }

  // Profile banner
  Widget profileBanner(
      {String? profileImage,
      String? followerCount,
      String? viewCount,
      String? followingCount}) {
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
              child: profileImage == null
                  ? placeHolderImage
                  : Image.network(
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
                  Text(translate!.translate(followerCount ?? "0"),
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
                  Text(translate!.translate(viewCount ?? "0"),
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
                  Text(translate!.translate(followingCount ?? "0"),
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
