import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  const CustomTile(
      {super.key, required this.title, required this.leadingIcon, this.onTap});

  final String title;
  final String leadingIcon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
            color: AppColors.lightGrey2, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
        )),
        child: Row(
          children: [
            Image.asset(leadingIcon, height: 25, width: 25),
            const SizedBox(width: 15),
            Text(title,
                style:
                    SubTitleHelper.h10.copyWith(fontWeight: FontWeight.w400)),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: AppColors.dark,
            )
          ],
        ),
      ),
    );
  }
}
