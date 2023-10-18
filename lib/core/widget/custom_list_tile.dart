import 'package:find_me/core/utils/app_assets.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {super.key, this.title = '', this.subTitle = '', this.leadingImage});

  String title;
  String subTitle;
  String? leadingImage;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: leadingImage == null
          ? null
          : CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(leadingImage!),
            ),
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: SizedBox(
        width: 75,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                // TODO: Add share Button Functionality
              },
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 17,
                child: Image.asset(
                  AppIcons.share,
                  height: 18,
                ),
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                // TODO: Add menu Button Functionality
              },
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 17,
                child: Image.asset(
                  AppIcons.menuCircular,
                  height: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
