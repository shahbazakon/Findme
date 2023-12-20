import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_profile_banner.dart';
import 'package:find_me/core/widget/custom_profile_info_tile.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/feature/portfolio_feature/corporatePortfolio/data/models/corporate_details+model.dart';
import 'package:find_me/feature/portfolio_feature/corporatePortfolio/presentation/cubit/corporate_portfolio_cubit.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/attachment_list_tile.com.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/blur_background.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CorporatePortfolioScreen extends StatefulWidget {
  final String corporateCardID;
  const CorporatePortfolioScreen({super.key, required this.corporateCardID});

  @override
  State<CorporatePortfolioScreen> createState() =>
      _CorporatePortfolioScreenState();
}

class _CorporatePortfolioScreenState extends State<CorporatePortfolioScreen> {
  @override
  void initState() {
    super.initState();
  }

  void apiCall() {
    context
        .read<CorporatePortfolioCubit>()
        .fetchCorporatePortfolioDetails(cardID: widget.corporateCardID);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<CorporatePortfolioCubit, CorporatePortfolioState>(
        listener: (context, state) {
          if (state is CorporatePortfolioError) {
            showSnackBar(title: state.errorMsg);
          }
        },
        builder: (context, state) {
          if (state is CorporatePortfolioError) {
            return const Loading(isSmall: false);
          } else if (state is CorporatePortfolioLoaded) {
            CorporateResult? data = state.academicDetailsModel.result;
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
                                Text(
                                  translate!.translate(
                                      "${data?.suffix ?? ""} ${data?.firstName ?? ""} ${data?.middleName ?? ""} ${data?.lastName ?? ""}" ??
                                          " "),
                                  style: TextHelper.h2
                                      .copyWith(color: AppFontsColors.light),
                                ),
                                Text(
                                  translate!.translate("@theroselady"),
                                  //TODO: add username
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
                      CustomProfileBanner(
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  socialAccountsButton(
                                      iconImage: AppIcons.facebook,
                                      onTap: () {
                                        showSnackBar(
                                            title:
                                                translate!.linkFacebookAccount);
                                      }),
                                  socialAccountsButton(
                                      iconImage: AppIcons.instagram,
                                      onTap: () {
                                        showSnackBar(
                                            title: translate!
                                                .linkInstagramAccount);
                                      }),
                                  socialAccountsButton(
                                      iconImage: AppIcons.twitter,
                                      onTap: () {
                                        showSnackBar(
                                            title:
                                                translate!.linkTwitterAccount);
                                      }),
                                  socialAccountsButton(
                                      iconImage: AppIcons.snapchat,
                                      onTap: () {
                                        showSnackBar(
                                            title:
                                                translate!.linkSnapchatAccount);
                                      }),
                                ],
                              ),
                            ),
                            sectionTitle(title: translate!.video),
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
