import 'dart:ui';

import 'package:find_me/core/helper/navigators.dart';
import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/feature/home_features/academicDetails/presentation/pages/academic_details_screen.dart';
import 'package:find_me/feature/home_features/businessDetails/presentation/pages/business_details_Screen.dart';
import 'package:find_me/feature/home_features/corporateDetails/presentation/pages/corporate_details.dart';
import 'package:find_me/feature/home_features/matrimonyDetails/presentation/pages/matrimony_details_screen.dart';
import 'package:find_me/feature/home_features/personalDetails/presentation/pages/personal_details_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/utils_methods.dart';

portfolioListPop(
    {bool showCloseButton = false, bool isTransparent = false}) async {
  Map portfolioList = {
    'Personal': const PersonalDetailsScreen(),
    'Academic': const AcademicDetailsScreen(),
    'Corporate': const CorporateDetailsScreen(),
    'Business': const BusinessDetailsScreen(),
    'Matrimony': const MatrimonyDetailsScreen()
  };

  return await showDialog(
    context: navigatorKey.currentContext!,
    barrierDismissible: false,
    barrierColor: isTransparent ? Colors.transparent : Colors.black38,
    builder: (BuildContext context) {
      return FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Material(
            color: isTransparent ? Colors.transparent : Colors.white,
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 10,
                sigmaX: 10,
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
                              Text('Select Portfolio', style: TextHelper.h8),
                              Text('you can select which portfolio to view',
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
                          String keys = portfolioList.keys.toList()[index];
                          return portfolioListTile(
                              title: keys, screenName: portfolioList[keys]);
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                              thickness: 1, color: AppFontsColors.lightGrey4);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

ListTile portfolioListTile(
    {required String title, required Widget screenName}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(title, style: TitleHelper.h8),
    trailing:
        Icon(Icons.arrow_forward_ios_outlined, color: AppColors.dark, size: 20),
    onTap: () {
      Navigator.of(navigatorKey.currentContext!).pop();
      cupertinoNavigator(
          type: NavigatorType.PUSHREPLACE, screenName: screenName);
    },
  );
}
