import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/core/widget/profile_picture_avatar.dart';
import 'package:flutter/material.dart';

class ProfileStackBanner extends StatelessWidget {
  const ProfileStackBanner(
      {super.key,
      required this.title,
      this.subTitle,
      required this.backgroundImage});

  final String title;
  final String? subTitle;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .315,
      child: Stack(
        children: [
          Image.network(
            backgroundImage,
            width: width,
            height: height * .25,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: width * .05,
            child: ProfilePictureAvatar(
              radius: width * .12,
              isShadowDown: true,
              isBorderVisible: false,
            ),
          ),
          Positioned(
            bottom: 0,
            left: width * .32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: SubTitleHelper.h6,
                ),
                subTitle == null
                    ? const SizedBox.shrink()
                    : Text(
                        subTitle!,
                        style: SubTitleHelper.h11
                            .copyWith(color: AppFontsColors.lightGrey3),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
