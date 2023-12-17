import 'dart:ui';

import 'package:find_me/core/constants/app_assets.dart';
import 'package:find_me/core/constants/app_color.dart';
import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/feature/portfolio_feature/AcademicPortfolio/presentation/pages/Academic_portfolio_screen.dart';
import 'package:find_me/feature/portfolio_feature/BusinessPortfolio/presentation/pages/business_portfolio_screendart.dart';
import 'package:find_me/feature/portfolio_feature/corporatePortfolio/presentation/pages/corporate_portfolio_screen.dart';
import 'package:find_me/feature/portfolio_feature/matrimonyPortfolio/presentation/pages/matrimonial_portfolio_screen.dart';
import 'package:find_me/feature/portfolio_feature/presonalPortfolio/presentation/pages/presonal_portfolio_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/utils_methods.dart';

portfolioListPop({
  bool showCloseButton = false,
  bool isTransparent = false,
  isReplacementRoute = false,
  final String? bgImage,
  required String personalCardID,
  required String academicCardID,
  required String corporateCardID,
  required String businessCardID,
  required String matrimonialCardID,
}) async {
  Map portfolioList = {
    'Personal': PersonalPortfolioScreen(personalCardID: personalCardID),
    'Academic': AcademicPortfolioScreen(academicCardID : academicCardID),
    'Corporate': CorporatePortfolioScreen(corporateCardID: corporateCardID),
    'Business': BusinessPortfolioScreen(businessCardID: businessCardID),
    'Matrimony':
        MatrimonialPortfolioScreen(matrimonialCardID: matrimonialCardID)
  };
  AppLocalizations? translate =
      AppLocalizations.of(navigatorKey.currentContext!);
  return await showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    barrierColor: isTransparent ? Colors.transparent : Colors.black38,
    builder: (BuildContext context) {
      double blur = isTransparent ? 10 : 0;
      return Stack(
        children: [
          bgImage == null
              ? const SizedBox.shrink()
              : Hero(
                  tag: "BackgroundImageTag",
                  child: Image.network(
                    bgImage,
                    height: height,
                    width: width,
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        AppIcons
                            .placeholderImage, // Replace with the path to your placeholder image
                        width: width,
                        height: height,
                        fit: BoxFit.cover,
                      );
                    },
                  )),
          Center(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Material(
                  color: isTransparent ? Colors.transparent : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaY: blur,
                      sigmaX: blur,
                    ),
                    child: Container(
                      width: width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        backgroundBlendMode: BlendMode.colorDodge,
                        color: isTransparent
                            ? Colors.white.withOpacity(0.5)
                            : AppColors.light,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(translate!.selectPortfolio,
                                        style: TextHelper.h8),
                                    Text(
                                        translate
                                            .youCanSelectWhichPortfolioToView,
                                        style: SubTitleHelper.h11),
                                  ],
                                ),
                              ),
                              Visibility(
                                  visible: showCloseButton,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: AppColors.lightGrey3,
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ))
                            ],
                          ),
                          SizedBox(
                            width: width,
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const AlwaysScrollableScrollPhysics(
                                  parent: BouncingScrollPhysics()),
                              itemCount: portfolioList.length,
                              itemBuilder: (context, index) {
                                String keys =
                                    portfolioList.keys.toList()[index];
                                return portfolioListTile(
                                    isReplacementRoute: isReplacementRoute,
                                    title: keys,
                                    screenName: portfolioList[keys]);
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                    thickness: 1,
                                    color: AppFontsColors.lightGrey4);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

ListTile portfolioListTile(
    {required String title,
    required Widget screenName,
    isReplacementRoute = false}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(title, style: TitleHelper.h8),
    trailing:
        Icon(Icons.arrow_forward_ios_outlined, color: AppColors.dark, size: 20),
    onTap: () {
      Navigator.of(navigatorKey.currentContext!).pop();
      cupertinoNavigator(
          type: isReplacementRoute
              ? NavigatorType.PUSHREPLACE
              : NavigatorType.PUSH,
          screenName: screenName);
    },
  );
}
