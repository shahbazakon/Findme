import 'package:find_me/core/utils/app_assets.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/theme_constants.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      this.subTitle,
      this.title,
      this.isHomeButtonVisible = false,
      this.subTitleWidget});
  final String? title;
  final String? subTitle;
  final Widget? subTitleWidget;
  final bool isHomeButtonVisible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light,
      body: Container(
        padding: primaryPadding,
        decoration: BoxDecoration(
            color: AppColors.light,
            image: DecorationImage(
              image: AssetImage(AppIcons.bgWhite),
              fit: BoxFit.cover,
            )),
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SvgPicture.asset(
                  AppImages.success,
                  height: height * .36,
                ),
                SizedBox(height: height * .05),
                Text(
                  title ?? "Successful",
                  textAlign: TextAlign.center,
                  style: TitleHelper.h7,
                ),
                SizedBox(height: height * .02),
                subTitleWidget ?? const SizedBox.shrink(),
                Visibility(
                  visible: subTitle != null,
                  child: Text(
                    "$subTitle",
                    textAlign: TextAlign.center,
                    style: SubTitleHelper.h11,
                  ),
                ),
              ]),
              isHomeButtonVisible
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        "Back to home",
                        style: SubTitleHelper.h9.copyWith(
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
