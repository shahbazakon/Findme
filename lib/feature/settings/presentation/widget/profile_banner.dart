import 'package:find_me/core/constants/common_ui.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_color.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/utils/utils_methods.dart';
import '../../../../core/widget/profile_picture_avatar.dart';

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
          const ProfilePictureAvatar(
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
                      //TODO: Add Edit Button Functionality
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
