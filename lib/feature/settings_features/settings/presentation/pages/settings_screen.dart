import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/constants_variables.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/models/portfolio_get_model.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/custom_snackBar.dart';
import 'package:find_me/core/widget/dialogBox/portolio_list_pop.dart';
import 'package:find_me/core/widget/loading.dart';
import 'package:find_me/feature/Profile/presentation/cubit/profile_details_cubit.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/pages/sign_in_screen.dart';
import 'package:find_me/feature/notifications/presentation/pages/notification_screen.dart';
import 'package:find_me/feature/settings_features/about/presentation/pages/about_screen.dart';
import 'package:find_me/feature/settings_features/followRequest/presentation/pages/follow_request_screen.dart';
import 'package:find_me/feature/settings_features/help/presentation/pages/help_screen.dart';
import 'package:find_me/feature/settings_features/settings/presentation/widget/custom_list_tile.dart';
import 'package:find_me/feature/settings_features/settings/presentation/widget/profile_banner.dart';
import 'package:find_me/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    apiCall();
    super.initState();
  }

  void apiCall() {
    String? userID = sharedPreferences?.getString(LocaleStorageKey.userID);
    if (userID != null) {
      context.read<ProfileDetailsCubit>().fetchProfileDetails(userID: userID);
    }
  }

  // Select language
  void _selectLanguage() async {
    AppLocalizations? translate = AppLocalizations.of(context);
    String? selectedLanguage = await openSelectionDialog(
        data: supportedLanguageList.keys.toList(),
        title: translate!.selectLanguage);
    if (selectedLanguage != null) {
      MyApp.setLocale(
          context, Locale(supportedLanguageList[selectedLanguage]!, ''));
      await sharedPreferences!.setString(LocaleStorageKey.appLanguage,
          supportedLanguageList[selectedLanguage]!);
    }
  }

  void onLogOut() async {
    await sharedPreferences?.setBool(LocaleStorageKey.isLoggedIn, false);
    cupertinoNavigator(
        type: NavigatorType.PUSHREMOVEUNTIL, screenName: const SignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(
            parent:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())),
        child: SizedBox(
          height: height,
          child: Column(
            children: [
              BlocConsumer<ProfileDetailsCubit, ProfileDetailsState>(
                listener: (context, state) {
                  if (state is ProfileDetailsError) {
                    showSnackBar(title: state.errorMsg);
                  }
                },
                builder: (context, state) {
                  if (state is ProfileDetailsLoading) {
                    return Container(
                        margin: EdgeInsets.only(top: height * .08),
                        height: height * .1,
                        child: const Loading(isSmall: false));
                  } else if (state is ProfileDetailsLoaded) {
                    PortfolioResult? data = state.portfolioGetModel.result;
                    return ProfileBanner(
                      title: translate!.translate(data?.name ?? ""),
                      subTitle: data?.email ?? "",
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              Expanded(
                child: ListView(
                  physics: const ScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  shrinkWrap: true,
                  children: [
                    CustomTile(
                      title: translate!.followRequest,
                      leadingIcon: AppIcons.beg,
                      onTap: () {
                        cupertinoNavigator(
                            screenName: const FollowRequestScreen());
                      },
                    ),
                    CustomTile(
                      title: translate!.portfolio,
                      leadingIcon: AppIcons.portfolio,
                      onTap: () {
                        portfolioListPop(
                            showCloseButton: true, isTransparent: false);
                      },
                    ),
                    // CustomTile(
                    //   title: translate!.subscription,
                    //   leadingIcon: AppIcons.creditCard,
                    //   onTap: () {},
                    // ),
                    CustomTile(
                      title: AppLocalizations.of(context)!.notifications,
                      leadingIcon: AppIcons.bellSimple,
                      onTap: () {
                        cupertinoNavigator(
                            screenName: const NotificationScreen());
                      },
                    ),
                    CustomTile(
                      title: translate!.help,
                      leadingIcon: AppIcons.help,
                      onTap: () {
                        cupertinoNavigator(screenName: const HelpScreen());
                      },
                    ),
                    CustomTile(
                      title: translate!.about,
                      leadingIcon: AppIcons.about,
                      onTap: () {
                        cupertinoNavigator(screenName: const AboutScreen());
                      },
                    ),
                    CustomTile(
                      title: translate!.language,
                      leadingIcon: AppIcons.language,
                      showArrow: false,
                      onTap: () {
                        _selectLanguage();
                      },
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                        top: BorderSide(
                          color: AppColors
                              .lightGrey2, // Adjust the color as needed
                          width: 1.0, // Adjust the width as needed
                        ),
                      )),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: AppButton(
                            label: translate!.logOut, onPressed: onLogOut))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
