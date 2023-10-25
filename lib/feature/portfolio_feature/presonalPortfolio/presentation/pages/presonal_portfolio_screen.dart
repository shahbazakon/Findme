import 'package:find_me/core/utils/app_color.dart';
import 'package:find_me/core/utils/text_style.dart';
import 'package:find_me/core/utils/utils_methods.dart';
import 'package:find_me/feature/portfolio_feature/presonalPortfolio/presentation/widget/cilpper_shape.dart';
import 'package:flutter/material.dart';

import '../widget/blur_background.dart';

class PersonalPortfolioScreen extends StatefulWidget {
  const PersonalPortfolioScreen({super.key});

  @override
  State<PersonalPortfolioScreen> createState() =>
      _PersonalPortfolioScreenState();
}

class _PersonalPortfolioScreenState extends State<PersonalPortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlurBackground(
            bgImage:
                "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
          ),
          Container(
            height: height * .38,
            child: Stack(
              children: [
                Positioned(
                  right: width * .55,
                  top: 0,
                  child: ClipperShape(
                    size: 150,
                    child: Image.network(
                        fit: BoxFit.cover,
                        "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg"),
                  ),
                ),
                Positioned(
                  right: width * .55,
                  top: height * .133,
                  child: ClipperShape(
                    size: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("1450",
                            style: TextHelper.h5
                                .copyWith(color: AppFontsColors.primary)),
                        Text("Followers",
                            style: TextHelper.h9
                                .copyWith(color: AppFontsColors.lightGrey3)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: width * .55,
                  top: height * .133,
                  child: ClipperShape(
                    size: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("1450",
                            style: TextHelper.h5
                                .copyWith(color: AppFontsColors.primary)),
                        Text("Followers",
                            style: TextHelper.h9
                                .copyWith(color: AppFontsColors.lightGrey3)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: width * .55,
                  top: height * .133,
                  child: ClipperShape(
                    size: 90,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("1450",
                            style: TextHelper.h5
                                .copyWith(color: AppFontsColors.primary)),
                        Text("Followers",
                            style: TextHelper.h9
                                .copyWith(color: AppFontsColors.lightGrey3)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
