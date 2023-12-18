// ignore_for_file: deprecated_member_use

import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/models/portfolio_get_model.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/dialogBox/portolio_list_pop.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/feature/Profile/presentation/cubit/profile_details_cubit.dart';
import 'package:find_me/feature/Profile/presentation/pages/qr_screen.dart';
import 'package:find_me/feature/Profile/presentation/widget/custom_gradient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  PortfolioResult? data;

  @override
  void initState() {
    // apiCall();
    super.initState();
  }

  // API Calling
  void apiCall() {
    String? userID = sharedPreferences?.getString(LocaleStorageKey.userID);
    if (userID != null) {
      context.read<ProfileDetailsCubit>().fetchProfileDetails(userID: userID);
    }
  }

  //On Portfolio Button Click
  onPortfolioClick() async {
    portfolioListPop(
      bgImage: data?.picture?.first.url,
      isTransparent: true,
      isReplacementRoute: false,
      showCloseButton: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      body: BlocConsumer<ProfileDetailsCubit, ProfileDetailsState>(
        listener: (context, state) {
          if (state is ProfileDetailsError) {
            showSnackBar(title: state.errorMsg);
          }
        },
        builder: (context, state) {
          if (state is ProfileDetailsLoading) {
            return const Loading(
              isSmall: false,
            );
          } else if (state is ProfileDetailsLoaded) {
            data = state.portfolioGetModel.result;

            return Stack(
              children: [
                ShadowOverlay(
                  shadowWidth: width,
                  shadowHeight: height * .3,
                  child: Hero(
                    tag: "BackgroundImageTag",
                    child: data?.picture?.first.url == null
                        ? Image.asset(
                            AppIcons.placeholderImage,
                            width: width,
                            height: contentHeight + height * .02,
                            fit: BoxFit.cover,
                          )
                        : Image.network(data!.picture!.first.url!,
                            width: width,
                            height: contentHeight + height * .02,
                            fit: BoxFit.cover, errorBuilder:
                                (BuildContext context, Object error,
                                    StackTrace? stackTrace) {
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
                                    fadeNavigator(
                                        screenName: QRScreen(
                                            rqText:
                                                "$userDetailsBaseURL/${sharedPreferences?.getString(LocaleStorageKey.userID)}",
                                            title: "${data?.name}",
                                            subTitle: translate!.translate(
                                              "${data?.purpleId}",
                                            )));
                                  },
                                  child: Hero(
                                    tag: "profileQRKey",
                                    child: GradientWidget(
                                      child: QrImageView(
                                        data:
                                            "$userDetailsBaseURL/${sharedPreferences?.getString(LocaleStorageKey.userID)}",
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
                                        translate!.translate("${data?.name}"),
                                        style: TextHelper.h1.copyWith(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                  Hero(
                                    tag: "profileUsernameKey",
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Text(
                                        translate!
                                            .translate("${data?.purpleId}"),
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
                            data?.tag ?? "",
                            textAlign: TextAlign.center,
                            style: SubTitleHelper.h12,
                          ),
                          SizedBox(height: height * .02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              followCountTile(
                                  title:
                                      data?.follower?.length.toString() ?? "0",
                                  subtitle: translate!.followers),
                              Container(
                                width: 1,
                                height: 40,
                                color: AppColors.dark,
                              ),
                              followCountTile(
                                  title:
                                      data?.following?.length.toString() ?? "0",
                                  subtitle: translate!.following),
                            ],
                          ),
                          SizedBox(height: height * .015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              /*   AppButton(
                                label: translate!.follow,
                                buttonWidth: width * .4,
                                onPressed: () {},
                              ),*/
                              Expanded(
                                child: AppButton(
                                    label: translate!.portfolio,
                                    buttonWidth: width * .4,
                                    onPressed: onPortfolioClick),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: Text("OOps, Something went wrong "),
            );
          }
        },
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
