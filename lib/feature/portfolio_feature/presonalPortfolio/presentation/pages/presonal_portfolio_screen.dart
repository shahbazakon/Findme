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
          const BlurBackground(
            bgImage:
                "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, color: AppColors.light)),
                      Column(
                        children: [
                          Text(
                            "Aliya Hayat",
                            style: TextHelper.h2
                                .copyWith(color: AppFontsColors.light),
                          ),
                          Text(
                            "@theroselady",
                            style: SubTitleHelper.h9
                                .copyWith(color: AppFontsColors.light),
                          ),
                        ],
                      ),
                      SizedBox.shrink()
                    ],
                  ),
                ),
                SizedBox(
                  height: height * .05,
                ),
                SizedBox(
                  height: height * .38,
                  child: Stack(
                    children: [
                      Positioned(
                        left: width * .3,
                        top: 0,
                        child: ClipperShape(
                          size: width * .37,
                          child: Image.network(
                              fit: BoxFit.cover,
                              "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg"),
                        ),
                      ),
                      Positioned(
                        left: width * .15,
                        top: height * .129,
                        child: ClipperShape(
                          size: width * .3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("1450",
                                  style: TextHelper.h5
                                      .copyWith(color: AppFontsColors.primary)),
                              Text("Followers",
                                  style: TextHelper.h10.copyWith(
                                      color: AppFontsColors.lightGrey3)),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * .51,
                        top: height * .143,
                        child: ClipperShape(
                          size: width * .26,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("28k",
                                  style: TextHelper.h6
                                      .copyWith(color: AppFontsColors.primary)),
                              Text("Views",
                                  style: TextHelper.h10.copyWith(
                                      color: AppFontsColors.lightGrey3)),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: width * .37,
                        top: height * .22,
                        child: ClipperShape(
                          size: width * .22,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("720",
                                  style: TextHelper.h7
                                      .copyWith(color: AppFontsColors.primary)),
                              Text("Following",
                                  style: TextHelper.h12.copyWith(
                                      color: AppFontsColors.lightGrey3)),
                            ],
                          ),
                        ),
                      ),
                    ],
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
