import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key, this.title});

  String? title;
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("$title"),
      elevation: 5,
      shadowColor: AppColors.lightGrey1,
    );
  }
}
