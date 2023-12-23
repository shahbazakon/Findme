import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/widget/profile_picture_avatar.dart';
import 'package:find_me/feature/notifications/presentation/pages/notification_screen.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      ///Manu option not have functionality
      // leading: IconButton(
      //   icon: Image.asset(AppIcons.menu, height: 25),
      //   onPressed: () {},
      // ),
      actions: [
        IconButton(
            onPressed: () {
              cupertinoNavigator(screenName: const NotificationScreen());
            },
            icon: Image.asset(AppIcons.bell)),
        Padding(
          padding: EdgeInsets.only(top: 10, right: 15),
          child: ProfilePictureAvatar(radius: 18),
        ),
      ],
    );
  }
}
