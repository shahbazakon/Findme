import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/app_assets.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/feature/settings/presentation/widget/profile_banner.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_color.dart';
import '../../../followRequest/presentation/pages/follow_request_screen.dart';
import '../widget/custom_list_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ProfileBanner(
            title: 'Aliya Hayat',
            subTitle: 'Aliya.hayat97@email.com',
          ),
          Expanded(
            child: ListView(
              physics:
                  const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              shrinkWrap: true,
              children: [
                CustomTile(
                  title: "Follow Request",
                  leadingIcon: AppIcons.beg,
                  onTap: () {
                    cupertinoNavigator(screenName: const FollowRequestScreen());
                  },
                ),
                CustomTile(
                  title: "Portfolio",
                  leadingIcon: AppIcons.portfolio,
                  onTap: () {},
                ),
                CustomTile(
                  title: "Subscription",
                  leadingIcon: AppIcons.creditCard,
                  onTap: () {},
                ),
                CustomTile(
                  title: "Notifications",
                  leadingIcon: AppIcons.bellSimple,
                  onTap: () {},
                ),
                CustomTile(
                  title: "Help",
                  leadingIcon: AppIcons.help,
                  onTap: () {},
                ),
                CustomTile(
                  title: "About",
                  leadingIcon: AppIcons.about,
                  onTap: () {},
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    top: BorderSide(
                      color: AppColors.lightGrey2, // Adjust the color as needed
                      width: 1.0, // Adjust the width as needed
                    ),
                  )),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: AppButton(label: "Log out", onPressed: () {}))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
