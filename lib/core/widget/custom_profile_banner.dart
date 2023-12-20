import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/portfolio_feature/personalPortfolio/presentation/widget/cilpper_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomProfileBanner extends StatefulWidget {
  const CustomProfileBanner(
      {super.key,
      this.followerCount,
      this.followingCount,
      this.profileImage,
      this.viewCount});

  final String? profileImage;
  final String? followerCount;
  final String? viewCount;
  final String? followingCount;

  @override
  State<CustomProfileBanner> createState() => _CustomProfileBannerState();
}

class _CustomProfileBannerState extends State<CustomProfileBanner> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return SizedBox(
      height: height * .38,
      child: Stack(
        children: [
          Positioned(
            left: width * .3,
            top: 0,
            child: ClipperShape(
              size: width * .37,
              child: widget.profileImage == null
                  ? placeHolderImage
                  : Image.network(
                      widget.profileImage!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(
            left: width * .15,
            top: height * .129,
            child: ClipperShape(
              size: width * .3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(translate!.translate(widget.followerCount ?? "0"),
                      style: TextHelper.h5
                          .copyWith(color: AppFontsColors.primary)),
                  Text(translate!.followers,
                      style: TextHelper.h10
                          .copyWith(color: AppFontsColors.lightGrey3)),
                ],
              ),
            ),
          ),
          Positioned(
            left: width * .51,
            top: height * .143,
            child: ClipperShape(
              size: width * .26,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(translate!.translate(widget.viewCount ?? "0"),
                      style: TextHelper.h6
                          .copyWith(color: AppFontsColors.primary)),
                  Text(translate!.views,
                      style: TextHelper.h10
                          .copyWith(color: AppFontsColors.lightGrey3)),
                ],
              ),
            ),
          ),
          Positioned(
            left: width * .37,
            top: height * .22,
            child: ClipperShape(
              size: width * .22,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(translate!.translate(widget.followingCount ?? "0"),
                      style: TextHelper.h7
                          .copyWith(color: AppFontsColors.primary)),
                  Text(translate!.following,
                      style: TextHelper.h12
                          .copyWith(color: AppFontsColors.lightGrey3)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
