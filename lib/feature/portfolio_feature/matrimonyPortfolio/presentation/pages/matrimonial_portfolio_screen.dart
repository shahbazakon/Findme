import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/formatter.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/custom_profile_banner.dart';
import 'package:find_me/core/widget/custom_profile_info_tile.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/feature/portfolio_feature/matrimonyPortfolio/data/models/matrimonial_details_models.dart';
import 'package:find_me/feature/portfolio_feature/matrimonyPortfolio/presentation/cubit/matrimonial_portfolio_cubit.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/attachment_list_tile.com.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/blur_background.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/video_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MatrimonialPortfolioScreen extends StatefulWidget {
  final String matrimonialCardID;
  const MatrimonialPortfolioScreen(
      {super.key, required this.matrimonialCardID});

  @override
  State<MatrimonialPortfolioScreen> createState() =>
      _MatrimonialPortfolioScreenState();
}

class _MatrimonialPortfolioScreenState
    extends State<MatrimonialPortfolioScreen> {
  MatrimonialDetailsResult? data;
  @override
  void initState() {
    apiCall();
    super.initState();
  }

  void apiCall() {
    context
        .read<MatrimonialPortfolioCubit>()
        .fetchMatrimonialPortfolioDetails(cardID: widget.matrimonialCardID);
  }

  String getSocialMediaURL({required String name}) {
    for (var element in data?.social ?? []) {
      if (name.toLowerCase() == element.title.toLowerCase()) {
        return element.label;
      }
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<MatrimonialPortfolioCubit, MatrimonialPortfolioState>(
        listener: (context, state) {
          if (state is MatrimonialPortfolioError) {
            showSnackBar(title: state.errorMsg);
          }
        },
        builder: (context, state) {
          if (state is MatrimonialPortfolioLoading) {
            return const Loading(isSmall: false);
          } else if (state is MatrimonialPortfolioLoaded) {
            data = state.academicDetailsModel.result;
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
                                            " "),
                                    overflow: TextOverflow.visible,
                                    style: TextHelper.h3
                                        .copyWith(color: AppFontsColors.light),
                                  ),
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
                                    "${data?.state}", //TODO: replace with Bio
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
                            sectionTitle(title: translate!.matrimonialDetails),
                            CustomProfileInfoTile(
                              leadingImage: AppIcons.beg,
                              title: "${data?.intro}",
                            ),
                            CustomProfileInfoTile(
                              leadingImage: AppIcons.beg,
                              title: data?.primaryEmail ?? "",
                            ),
                            CustomProfileInfoTile(
                              leadingImage: AppIcons.portfolio,
                              title: dateFormatter2
                                  .format(DateTime.parse(data!.dob.toString())),
                            ),
                            CustomProfileInfoTile(
                              leadingImage: AppIcons.creditCard,
                              title: '''
${translate!.street}: ${translate!.translate("${data?.primaryAddress}")},
${translate!.city}: ${translate!.translate("${data?.city}")}
${translate!.zipCode}: ${translate!.translate("${data?.zipCode}")} 
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
                              title: "+678-9876543456",
                            ),
                            Visibility(
                              visible: data?.social?.length != 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  sectionTitle(title: translate!.socialProfile),
                                  SizedBox(
                                    height: height * .055,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: SizedBox(
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: data?.social?.length ?? 0,
                                          itemBuilder: (context, index) {
                                            return FittedBox(
                                              child: socialAccountsButton(
                                                  iconImage:
                                                      "assets/icons/${data?.social?[index].title?.toLowerCase()}.png",
                                                  onTap: () {
                                                    openOnBrowser(
                                                        url: getSocialMediaURL(
                                                            name:
                                                                "${data?.social?[index].title}"));
                                                  }),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  )
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
                              physics: const NeverScrollableScrollPhysics(),
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
            return Center(
              child: Text(translate!.oopsSomethingWentWrong),
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
