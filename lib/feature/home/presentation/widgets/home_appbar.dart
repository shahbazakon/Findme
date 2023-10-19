import 'package:find_me/feature/notifications/presentation/pages/notification_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/helper/navigators.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/widget/profile_picture_avatar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Image.asset(AppIcons.menu, height: 25),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            onPressed: () {
              cupertinoNavigator(screenName: const NotificationScreen());
            },
            icon: Image.asset(AppIcons.bell)),
        const Padding(
          padding: EdgeInsets.only(top: 10, right: 15),
          child: ProfilePictureAvatar(radius: 18),
        ),
      ],
    );
  }
}
