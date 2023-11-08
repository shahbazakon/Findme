import 'dart:developer';

import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/constants_variables.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/core/widget/dialogBox/portolio_list_pop.dart';
import 'package:find_me/feature/notifications/presentation/pages/notification_screen.dart';
import 'package:find_me/feature/settings_features/about/presentation/pages/about_screen.dart';
import 'package:find_me/feature/settings_features/followRequest/presentation/pages/follow_request_screen.dart';
import 'package:find_me/feature/settings_features/help/presentation/pages/help_screen.dart';
import 'package:find_me/feature/settings_features/settings/presentation/widget/custom_list_tile.dart';
import 'package:find_me/feature/settings_features/settings/presentation/widget/profile_banner.dart';
import 'package:find_me/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Select language
  void _selectLanguage() async {
    var translate = AppLocalizations.of(context);
    String? selectedPrefix = await openSelectionDialog(
        data: supportedLanguageList, title: translate!.selectLanguage);
    if (selectedPrefix != null) {
      log('selectedPrefix: $selectedPrefix');
      MyApp.setLocale(context, Locale(selectedPrefix, ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    var translate = AppLocalizations.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(
            parent:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())),
        child: SizedBox(
          height: height,
          child: Column(
            children: [
              ProfileBanner(
                title: 'Aliya Hayat',
                subTitle: 'Aliya.hayat97@email.com',
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
                    CustomTile(
                      title: translate!.subscription,
                      leadingIcon: AppIcons.creditCard,
                      onTap: () {},
                    ),
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
                            label: translate!.logOut, onPressed: () {}))
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
