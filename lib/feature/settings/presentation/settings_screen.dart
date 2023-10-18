import 'package:find_me/core/constants/common_ui.dart';
import 'package:find_me/core/utils/app_assets.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/widget/button/app_Button_widget.dart';
import 'package:find_me/feature/settings/presentation/widget/profile_banner.dart';
import 'package:flutter/material.dart';

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
            child: ListView.separated(
              physics:
                  const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  padding: primaryPadding,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Image.asset(AppIcons.user, height: 25),
                      const SizedBox(width: 15),
                      Text('Follow Request',
                          style: SubTitleHelper.h10
                              .copyWith(fontWeight: FontWeight.w400)),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: AppColors.dark,
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.lightGrey2,
                  thickness: 1,
                );
              },
            ),
          ),
          AppButton(label: "Log out", onPressed: () {})
        ],
      ),
    );
  }
}
