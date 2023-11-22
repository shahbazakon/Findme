import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/auth_featrues/signIn/presentation/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    AppLocalizations? translate = AppLocalizations.of(context);
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
                Padding(
                  padding: EdgeInsets.only(right: width * .09),
                  child: SvgPicture.asset(
                    AppImages.success,
                    height: height * .36,
                  ),
                ),
                SizedBox(height: height * .05),
                Text(
                  title ?? translate!.successful,
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
                    style: SubTitleHelper.h10,
                  ),
                ),
              ]),
              isHomeButtonVisible
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        onTap: () {
                          cupertinoNavigator(screenName: const SignInScreen());
                        },
                        child: Text(
                          translate!.backToHome,
                          style: SubTitleHelper.h9.copyWith(
                              fontWeight: FontWeight.w200,
                              fontStyle: FontStyle.italic),
                        ),
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
