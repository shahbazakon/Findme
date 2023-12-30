import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/constants/theme_constants.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FollowRequestListTile extends StatelessWidget {
  FollowRequestListTile(
      {super.key,
      this.title = '',
      this.subTitle = '',
      this.leadingImage,
      this.onTap,
      this.isShowButton = true,
      this.isSent = false});

  String title;
  Function()? onTap;
  String subTitle;
  String? leadingImage;
  bool isShowButton;
  bool isSent;
  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Padding(
      padding: primaryPadding,
      child: ListTile(
        onTap: onTap,
        splashColor: AppColors.primary,
        contentPadding: EdgeInsets.zero,
        leading: leadingImage == null
            ? Image.asset(
                AppIcons
                    .placeholderImage, // Replace with the path to your placeholder image
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              )
            : CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(leadingImage!),
              ),
        title: Text(title, style: SubTitleHelper.h11),
        subtitle: Text(subTitle,
            style: SubTitleHelper.h12.copyWith(color: AppColors.lightGrey3)),
        trailing: Visibility(
          visible: isShowButton,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: width * .28,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(20)),
              child: FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    isSent
                        ? Icon(
                            Icons.check,
                            size: 16,
                            color: AppColors.light,
                          )
                        : Image.asset(AppIcons.addUser, height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        isSent ? translate!.sent : translate!.connect,
                        style:
                            SubTitleHelper.h12.copyWith(color: AppColors.light),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
