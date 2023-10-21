import 'package:find_me/core/utils/app_assets.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/theme_contants.dart';
import '../../../../core/utils/utils_methods.dart';

class FollowRequestListTile extends StatelessWidget {
  FollowRequestListTile(
      {super.key,
      this.title = '',
      this.subTitle = '',
      this.leadingImage,
      this.isShowButton = true,
      this.isSent = false});

  String title;
  String subTitle;
  String? leadingImage;
  bool isShowButton;
  bool isSent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: primaryPadding,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: leadingImage == null
            ? null
            : CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(leadingImage!),
              ),
        title: Text(title),
        subtitle: Text(subTitle),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  isSent
                      ? Icon(
                          Icons.check,
                          size: 18,
                          color: AppColors.light,
                        )
                      : Image.asset(AppIcons.addUser, height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      isSent ? "Sent" : "Connect",
                      style:
                          SubTitleHelper.h11.copyWith(color: AppColors.light),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
