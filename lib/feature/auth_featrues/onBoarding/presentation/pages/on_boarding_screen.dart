import 'dart:async';

import 'package:find_me/feature/auth_featrues/signIn/presentation/pages/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/theme_constants.dart';
import '../../../../../core/helper/navigators.dart';
import '../../../../../core/utils/utils_methods.dart';
import '../../../../../core/widget/button/app_Button_widget.dart';
import '../widget/dots_indicator_widget.dart';
import '../widget/on_boarding_page_View.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  //controls the actions of Page View
  final _pageController = PageController(initialPage: 0);

  //get the page value to indicate the current page in Page Indicator
  final _currentPageNotifier = ValueNotifier<int>(0);

  // Create a Timer to handle auto-scrolling
  final int _numPages = 6;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start auto-scrolling when the widget is initialized
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPageNotifier.value < _numPages - 1) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        // Stop the timer when it reaches the last page
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    // Dispose of the PageController and Timer to prevent memory leaks
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? translate = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
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
                          height: height * .68,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (value) {
                              _currentPageNotifier.value = value;
                            },
                            children: <Widget>[
                              OnBoardingPageView(
                                title: translate!.academic,
                                subText: translate!.lorem,
                                image: AppSvg.onBoarding1,
                              ),
                              OnBoardingPageView(
                                title: translate!.corporate,
                                subText: translate!.lorem,
                                image: AppSvg.onBoarding2,
                              ),
                              OnBoardingPageView(
                                title: translate!.business,
                                subText: translate!.lorem,
                                image: AppSvg.onBoarding3,
                              ),
                              OnBoardingPageView(
                                title: translate!.matrimony,
                                subText: translate!.lorem,
                                image: AppSvg.onBoarding4,
                              ),
                              OnBoardingPageView(
                                title: translate!.personal,
                                subText: translate!.lorem,
                                image: AppSvg.onBoarding5,
                              ),
                              OnBoardingPageView(
                                title: translate!.getStarted,
                                subTitle: translate!.letsGetStarted,
                                subText: translate!.lorem,
                                image: AppSvg.onBoarding6,
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
                                  label: translate!.getStarted,
                                  onPressed: () {
                                    cupertinoNavigator(
                                        type: NavigatorType.PUSHREMOVEUNTIL,
                                        screenName: const SignInScreen());
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
