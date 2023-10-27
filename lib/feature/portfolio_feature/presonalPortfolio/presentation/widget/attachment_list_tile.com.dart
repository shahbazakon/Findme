import 'package:find_me/core/utils/app_assets.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class AttachmentListTile extends StatelessWidget {
  const AttachmentListTile(
      {super.key, required this.title, this.onDownloadClick, this.onClick});

  final String title;
  final Function()? onDownloadClick;
  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, bottom: 6),
      decoration: BoxDecoration(
          color: AppColors.primary, borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 7),
        onTap: onClick,
        leading: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: AppColors.light),
            child: Image.asset(
              AppIcons.attachFile,
              scale: 3,
            )),
        title: Text(title,
            style: SubTitleHelper.h9.copyWith(color: AppFontsColors.light)),
        trailing: InkWell(
          onTap: onDownloadClick,
          child: Text(
            "Download",
            style: SubTitleHelper.h10.copyWith(
              color: AppFontsColors.light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
