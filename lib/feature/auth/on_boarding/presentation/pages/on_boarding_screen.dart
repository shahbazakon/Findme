import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_color.dart';
import '../on_boarding_page_View.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "",
              bodyWidget: OnBoardingPageView(
                title: "Academic",
                subText:
                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                image: AppOnBoardingAssets.onBoarding1,
              ),
            ),
            PageViewModel(
              title: "",
              bodyWidget: OnBoardingPageView(
                title: "Corporate",
                subText:
                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                image: AppOnBoardingAssets.onBoarding2,
              ),
            ),
            PageViewModel(
              title: "",
              bodyWidget: OnBoardingPageView(
                title: "Business",
                subText:
                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                image: AppOnBoardingAssets.onBoarding3,
              ),
            ),
            PageViewModel(
              title: "",
              bodyWidget: OnBoardingPageView(
                title: "Matrimony",
                subText:
                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                image: AppOnBoardingAssets.onBoarding4,
              ),
            ),
            PageViewModel(
              title: "",
              bodyWidget: OnBoardingPageView(
                title: "Personal",
                subText:
                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                image: AppOnBoardingAssets.onBoarding5,
              ),
            ),
            PageViewModel(
              title: "",
              bodyWidget: OnBoardingPageView(
                title: "Get Started!",
                subTitle: "Lets Get Started!",
                subText:
                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                image: AppOnBoardingAssets.onBoarding1,
              ),
            ),
          ],
          scrollPhysics: const ClampingScrollPhysics(),
          showDoneButton: true,
          showNextButton: false,
          showSkipButton: false,
          onDone: () {
            if (kDebugMode) {
              print("Done clicked");
            }
          },
          overrideDone: FilledButton(
              onPressed: () {},
              child: const Text("Done",
                  style: TextStyle(fontWeight: FontWeight.w600))),
          dotsDecorator: getDotsDecorator()),
    );
  }

  DotsDecorator getDotsDecorator() {
    return DotsDecorator(
      spacing: const EdgeInsets.symmetric(horizontal: 2),
      activeColor: AppColors.primary,
      color: Colors.grey.shade300,
    );
  }
}
