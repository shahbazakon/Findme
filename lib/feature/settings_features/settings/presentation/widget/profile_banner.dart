import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/local_storege_key.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/profile_picture_avatar.dart';
import 'package:find_me/feature/auth_featrues/createProfile/presentation/pages/create_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileBanner extends StatelessWidget {
  ProfileBanner({
    super.key,
    this.subTitle = '',
    required this.title,
  });

  String title;
  String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: primaryPadding,
      margin: EdgeInsets.only(top: height * .08),
      child: Row(
        children: [
          ProfilePictureAvatar(
            radius: 45,
            isShadowDown: true,
            isBorderVisible: false,
          ),
          SizedBox(width: width * .05),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: SubTitleHelper.h6,
                  ),
                  InkWell(
                    onTap: () {
                      String userID = sharedPreferences!
                          .getString(LocaleStorageKey.userEmail)!;
                      cupertinoNavigator(
                          screenName: CreateProfile(
                        id: userID,
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Image.asset(
                        AppIcons.pen,
                        height: 18,
                        color: AppColors.primary,
                      ),
                    ),
                  )
                ],
              ),
              Text(
                subTitle,
                style: SubTitleHelper.h11
                    .copyWith(color: AppFontsColors.lightGrey4),
              )
            ],
          )
        ],
      ),
    );
  }
}
