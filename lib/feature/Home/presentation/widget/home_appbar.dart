import 'package:flutter/material.dart';

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
        IconButton(onPressed: () {}, icon: Image.asset(AppIcons.bell)),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ProfilePictureAvatar(radius: 18),
        ),
      ],
    );
  }
}
