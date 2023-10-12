import 'package:flutter/material.dart';

import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/utils_methods.dart';
import '../../../../core/helper/navigators.dart';
import '../../../../core/widget/button/app_Button_widget.dart';
import '../../../signUp/presentation/pages/sign_up_screen.dart';
import '../widget/dots_indicator_widget.dart';
import '../widget/on_boarding_page_View.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  //controls the actions of Page View
  final _pageController = PageController(initialPage: 0);

  //get the page value to indicate the current page in Page Indicator
  final _currentPageNotifier = ValueNotifier<int>(0);

  // Create a Timer to handle auto-scrolling
  final int _numPages = 6;

  @override
  void dispose() {
    // Dispose of the PageController and Timer to prevent memory leaks
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: primaryPadding,
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<int>(
                  valueListenable: _currentPageNotifier,
                  builder: (context, currentPageValue, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: height * .03,
                        ),
                        SizedBox(
                          height: height * .75,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (value) {
                              _currentPageNotifier.value = value;
                            },
                            children: <Widget>[
                              OnBoardingPageView(
                                title: "Academic",
                                subText:
                                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                                image: AppOnBoardingAssets.onBoarding1,
                              ),
                              OnBoardingPageView(
                                title: "Corporate",
                                subText:
                                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                                image: AppOnBoardingAssets.onBoarding2,
                              ),
                              OnBoardingPageView(
                                title: "Business",
                                subText:
                                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                                image: AppOnBoardingAssets.onBoarding3,
                              ),
                              OnBoardingPageView(
                                title: "Matrimony",
                                subText:
                                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                                image: AppOnBoardingAssets.onBoarding4,
                              ),
                              OnBoardingPageView(
                                title: "Personal",
                                subText:
                                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                                image: AppOnBoardingAssets.onBoarding5,
                              ),
                              OnBoardingPageView(
                                title: "Get Started!",
                                subTitle: "Lets Get Started!",
                                subText:
                                    "Lorem ipsum dolor sit amet, consectetur incididunt ut labore et dolore magna aliqua.",
                                image: AppOnBoardingAssets.onBoarding6,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          alignment: Alignment.bottomCenter,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomDotsIndicator(
                                  numPages: _numPages,
                                  pageController: _pageController),
                              SizedBox(
                                height: size.height * .03,
                              ),
                              Visibility(
                                visible: currentPageValue == 5,
                                child: AppButton(
                                  label: "Get Started",
                                  onPressed: () {
                                    cupertinoNavigator(
                                        type: NavigatorType.PUSHREMOVEUNTIL,
                                        screenName: const SignUpScreen());
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
